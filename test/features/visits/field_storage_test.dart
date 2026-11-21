import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jawlati/core/services/location_service.dart';
import 'package:jawlati/core/storage/field_database.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:jawlati/features/clients/data/repo/client_repository.dart';
import 'package:jawlati/features/visits/data/models/client_visit_model.dart';
import 'package:jawlati/features/visits/data/repo/visits_repository.dart';
import 'package:jawlati/features/visits/logic/visits_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../support/test_location.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Directory directory;
  late FieldDatabase store;
  late ClientRepository clients;
  late VisitsRepository visits;
  late TestLocation location;

  void openStore() {
    store = FieldDatabase(path: '${directory.path}/test.db');
    clients = ClientRepositoryImpl(store);
    visits = VisitsRepository(store, clients, location);
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    directory = await Directory.systemTemp.createTemp('jawlati-test-');
    location = TestLocation();
    openStore();
  });

  tearDown(() async {
    await store.close();
    await directory.delete(recursive: true);
  });

  test('client and active visit survive reopening the database', () async {
    final seedCount = (await clients.getAllClients()).length;
    final client = await clients.addClient(
      const Client(id: '', name: 'عميل اختبار', phone: '0000000000'),
    );
    final visit = await visits.checkIn(clientId: client.id);

    await store.close();
    openStore();

    expect(await clients.getClientById(client.id), client);
    expect(await clients.getAllClients(), hasLength(seedCount + 1));
    expect(await visits.getCurrentVisit(), visit);
    await visits.checkOut(notes: 'تمت الزيارة');
    expect(await visits.getCurrentVisit(), isNull);
    expect(await visits.getAllVisits(), [
      isA<ClientVisit>()
          .having((v) => v.id, 'id', visit.id)
          .having((v) => v.status, 'status', VisitStatus.checkedOut)
          .having((v) => v.notes, 'notes', 'تمت الزيارة'),
    ]);
  });

  test('two simultaneous check-ins leave exactly one active record', () async {
    final client = (await clients.getAllClients()).first;
    Future<Object> attempt() async {
      try {
        return await visits.checkIn(clientId: client.id);
      } on VisitFailure catch (failure) {
        return failure;
      }
    }

    final results = await Future.wait([attempt(), attempt()]);
    expect(results.whereType<ClientVisit>(), hasLength(1));
    expect(results, contains(VisitFailure.alreadyActive));
    expect(await visits.getAllVisits(), hasLength(1));
  });

  test('failed insert and update preserve state and allow retry', () async {
    final client = (await clients.getAllClients()).first;
    await visits.getAllVisits();
    final db = await store.database;

    await db.execute(
      "CREATE TRIGGER fail_insert BEFORE INSERT ON visits "
      "BEGIN SELECT RAISE(ABORT, 'simulated failure'); END",
    );
    await expectLater(
      visits.checkIn(clientId: client.id),
      throwsA(isA<DatabaseException>()),
    );
    expect(await visits.getAllVisits(), isEmpty);
    await db.execute('DROP TRIGGER fail_insert');

    final visit = await visits.checkIn(clientId: client.id);
    await db.execute(
      "CREATE TRIGGER fail_update BEFORE UPDATE ON visits "
      "BEGIN SELECT RAISE(ABORT, 'simulated failure'); END",
    );
    await expectLater(visits.checkOut(), throwsA(isA<DatabaseException>()));
    expect(await visits.getCurrentVisit(), visit);
    await db.execute('DROP TRIGGER fail_update');

    await visits.cancelCurrentVisit();
    final history = await visits.getAllVisits();
    expect(history.single.id, visit.id);
    expect(history.single.status, VisitStatus.cancelled);
    expect(await visits.getCurrentVisit(), isNull);
  });

  test(
    'location failure preserves the current Cubit state and allows retry',
    () async {
      final client = (await clients.getAllClients()).first;
      final cubit = VisitsCubit(visits);
      addTearDown(cubit.close);
      await cubit.initialize();

      location.issue = LocationFailure.deniedForever;
      expect(
        await cubit.checkIn(clientId: client.id),
        VisitIssue.locationDeniedForever,
      );
      expect(cubit.state.currentVisit, isNull);
      expect(await visits.getAllVisits(), isEmpty);

      location.issue = null;
      expect(await cubit.checkIn(clientId: client.id), isNull);
      final visit = cubit.state.currentVisit;

      location.issue = LocationFailure.timedOut;
      expect(await cubit.checkOut(notes: 'retry'), VisitIssue.locationTimedOut);
      expect(cubit.state.currentVisit, visit);
      expect(await visits.getCurrentVisit(), visit);

      location.issue = null;
      expect(await cubit.checkOut(notes: 'retry'), isNull);
      expect((await visits.getAllVisits()).single.notes, 'retry');
    },
  );

  ClientVisit legacyVisit(String id) => ClientVisit(
    id: id,
    clientId: '1',
    clientName: 'اسم عميل قديم',
    salesmanId: demoSalesmanId,
    checkInTime: DateTime.utc(2025),
    checkInLatitude: 31,
    checkInLongitude: 34,
  );

  String encode(ClientVisit visit) => jsonEncode(visit.toJson());

  test('legacy migration prefers terminal records and is idempotent', () async {
    final oldActive = legacyVisit('first');
    final completed = oldActive.copyWith(status: VisitStatus.checkedOut);
    final other = legacyVisit('second').copyWith(status: VisitStatus.cancelled);
    SharedPreferences.setMockInitialValues({
      'current_visit': encode(oldActive),
      'client_visits': [encode(completed), encode(other)],
    });
    expect(await visits.getCurrentVisit(), isNull);
    expect(await visits.getAllVisits(), unorderedEquals([completed, other]));

    await store.close();
    openStore();
    final rows = await (await store.database).query('visits');
    expect(rows.every((row) => row['client_id'] == null), isTrue);
    expect(await visits.getAllVisits(), unorderedEquals([completed, other]));
  });

  test('invalid legacy data aborts migration and can be retried', () async {
    final active = legacyVisit('active');
    SharedPreferences.setMockInitialValues({
      'current_visit': encode(active),
      'client_visits': ['invalid JSON'],
    });
    await expectLater(visits.getAllVisits(), throwsFormatException);
    expect(await (await store.database).query('visits'), isEmpty);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getStringList('client_visits'), ['invalid JSON']);
    await prefs.remove('client_visits');
    expect(await visits.getCurrentVisit(), active);
    expect(await visits.getAllVisits(), [active]);
  });
}
