import 'dart:convert';

import 'package:jawlati/core/services/location_service.dart';
import 'package:jawlati/core/storage/field_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../../../clients/data/repo/client_repository.dart';
import '../models/client_visit_model.dart';

const demoSalesmanId = '1';
const demoSalesmanName = 'المندوب التجريبي';

enum VisitFailure implements Exception {
  alreadyActive,
  noActiveVisit,
  clientNotFound,
}

class VisitsRepository {
  VisitsRepository(this._store, this._clients, this._location);

  final FieldDatabase _store;
  final ClientRepository _clients;
  final LocationService _location;
  Future<void>? _migration;

  static const _legacyCurrent = 'current_visit';
  static const _legacyHistory = 'client_visits';
  static const _migrationKey = 'legacy_visits_v1';

  Future<Database> _ready() async {
    final db = await _store.database;
    await (_migration ??= _migrate(db));
    return db;
  }

  Future<void> _migrate(Database db) async {
    try {
      await db.transaction((txn) async {
        final migrated = await txn.query(
          'field_metadata',
          where: 'key = ?',
          whereArgs: [_migrationKey],
        );
        if (migrated.isNotEmpty) return;

        final prefs = await SharedPreferences.getInstance();
        final active = prefs.getString(_legacyCurrent);
        final history = prefs.getStringList(_legacyHistory) ?? [];
        final visits = <String, ClientVisit>{};

        for (final payload in [...history, if (active != null) active]) {
          final visit = _decode(payload);
          final previous = visits[visit.id];
          if (previous == null || _prefer(visit, previous)) {
            visits[visit.id] = visit;
          }
        }

        for (final visit in visits.values) {
          // Legacy pickers reused client IDs for different people. Keep the
          // snapshot in the payload without associating it with a new client.
          await txn.insert('visits', _row(visit, clientId: null));
        }
        await txn.insert('field_metadata', {'key': _migrationKey});
      });
    } catch (_) {
      _migration = null;
      rethrow;
    }
  }

  bool _prefer(ClientVisit candidate, ClientVisit previous) {
    if (candidate.isActive != previous.isActive) return !candidate.isActive;
    return (candidate.updatedAt ?? candidate.checkInTime).isAfter(
      previous.updatedAt ?? previous.checkInTime,
    );
  }

  ClientVisit _decode(String payload) =>
      ClientVisit.fromJson(jsonDecode(payload) as Map<String, dynamic>);

  Map<String, Object?> _row(ClientVisit visit, {required String? clientId}) => {
    'id': visit.id,
    'client_id': clientId,
    'salesman_id': visit.salesmanId,
    'check_in_time': visit.checkInTime.millisecondsSinceEpoch,
    'status': visit.status.name,
    'payload': jsonEncode(visit.toJson()),
  };

  Future<ClientVisit?> _active(DatabaseExecutor db) async {
    final rows = await db.query(
      'visits',
      columns: ['payload'],
      where: 'salesman_id = ? AND status = ?',
      whereArgs: [demoSalesmanId, VisitStatus.checkedIn.name],
      limit: 1,
    );
    return rows.isEmpty ? null : _decode(rows.single['payload'] as String);
  }

  Future<ClientVisit> checkIn({
    required String clientId,
    String? purpose,
    String? notes,
  }) async {
    final db = await _ready();
    if (await _active(db) != null) throw VisitFailure.alreadyActive;

    final client = await _clients.getClientById(clientId);
    if (client == null || !client.isActive) throw VisitFailure.clientNotFound;

    final position = await _location.getCurrentLocation();
    final now = DateTime.now().toUtc();
    final visit = ClientVisit(
      id: const Uuid().v4(),
      clientId: client.id,
      clientName: client.name,
      salesmanId: demoSalesmanId,
      salesmanName: demoSalesmanName,
      checkInTime: now,
      checkInLatitude: position.latitude,
      checkInLongitude: position.longitude,
      purpose: purpose,
      notes: notes,
      createdAt: now,
      updatedAt: now,
    );
    return db.transaction((txn) async {
      if (await _active(txn) != null) throw VisitFailure.alreadyActive;
      await txn.insert('visits', _row(visit, clientId: client.id));
      return visit;
    });
  }

  Future<void> checkOut({String? notes}) async {
    final visit = await getCurrentVisit();
    if (visit == null) throw VisitFailure.noActiveVisit;

    final position = await _location.getCurrentLocation();
    final now = DateTime.now().toUtc();
    await _finish(
      visit.copyWith(
        checkOutTime: now,
        checkOutLatitude: position.latitude,
        checkOutLongitude: position.longitude,
        notes: notes ?? visit.notes,
        status: VisitStatus.checkedOut,
        updatedAt: now,
      ),
    );
  }

  Future<void> cancelCurrentVisit() async {
    final visit = await getCurrentVisit();
    if (visit == null) throw VisitFailure.noActiveVisit;

    await _finish(
      visit.copyWith(
        status: VisitStatus.cancelled,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> _finish(ClientVisit visit) async {
    final db = await _ready();
    final updated = await db.update(
      'visits',
      {'status': visit.status.name, 'payload': jsonEncode(visit.toJson())},
      where: 'id = ? AND status = ?',
      whereArgs: [visit.id, VisitStatus.checkedIn.name],
    );
    if (updated != 1) throw VisitFailure.noActiveVisit;
  }

  Future<ClientVisit?> getCurrentVisit() async => _active(await _ready());

  Future<List<ClientVisit>> getAllVisits() async {
    final db = await _ready();
    final rows = await db.query(
      'visits',
      columns: ['payload'],
      orderBy: 'check_in_time DESC, id',
    );
    return rows.map((row) => _decode(row['payload'] as String)).toList();
  }
}
