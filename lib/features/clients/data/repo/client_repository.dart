import 'dart:convert';

import 'package:jawlati/core/storage/field_database.dart';
import 'package:uuid/uuid.dart';

import '../models/client_model.dart';

abstract class ClientRepository {
  Future<List<Client>> getAllClients();
  Future<Client> addClient(Client client);
  Future<Client> updateClient(Client client);
  Future<void> deleteClient(String clientId);
  Future<Client?> getClientById(String clientId);
}

class ClientRepositoryImpl implements ClientRepository {
  ClientRepositoryImpl(this._store);

  final FieldDatabase _store;

  static const _seed = [
    Client(
      id: 'demo-client-1',
      name: 'متجر الندى (تجريبي)',
      phone: '0000000001',
      type: ClientType.company,
    ),
    Client(
      id: 'demo-client-2',
      name: 'متجر السهل (تجريبي)',
      phone: '0000000002',
      type: ClientType.company,
    ),
    Client(
      id: 'demo-client-3',
      name: 'عميل تجريبي',
      phone: '0000000003',
      type: ClientType.individual,
    ),
  ];

  Future<void>? _seeding;

  Future<void> _seedOnce() async {
    try {
      final db = await _store.database;
      await db.transaction((txn) async {
        final seeded = await txn.query(
          'field_metadata',
          where: 'key = ?',
          whereArgs: ['demo_clients_v1'],
        );
        if (seeded.isNotEmpty) return;

        final now = DateTime.now().toUtc();
        for (final client in _seed) {
          await txn.insert(
            'clients',
            _row(client.copyWith(createdAt: now, updatedAt: now)),
          );
        }
        await txn.insert('field_metadata', {'key': 'demo_clients_v1'});
      });
    } catch (_) {
      _seeding = null;
      rethrow;
    }
  }

  Future<void> _ensureSeeded() => _seeding ??= _seedOnce();

  Map<String, Object?> _row(Client client) => {
    'id': client.id,
    'payload': jsonEncode(client.toJson()),
  };

  Client _decode(Map<String, Object?> row) => Client.fromJson(
    jsonDecode(row['payload'] as String) as Map<String, dynamic>,
  );

  @override
  Future<List<Client>> getAllClients() async {
    await _ensureSeeded();
    final db = await _store.database;
    return (await db.query('clients', orderBy: 'rowid')).map(_decode).toList();
  }

  @override
  Future<Client> addClient(Client client) async {
    await _ensureSeeded();
    final now = DateTime.now().toUtc();
    final saved = client.copyWith(
      id: const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
    );
    final db = await _store.database;
    await db.insert('clients', _row(saved));
    return saved;
  }

  @override
  Future<Client> updateClient(Client client) async {
    await _ensureSeeded();
    final db = await _store.database;
    final updated = client.copyWith(updatedAt: DateTime.now().toUtc());
    final count = await db.update(
      'clients',
      _row(updated),
      where: 'id = ?',
      whereArgs: [client.id],
    );
    if (count == 0) throw StateError('Client not found');
    return updated;
  }

  @override
  Future<void> deleteClient(String clientId) async {
    throw UnsupportedError('Client deletion is unavailable in this demo');
  }

  @override
  Future<Client?> getClientById(String clientId) async {
    await _ensureSeeded();
    final db = await _store.database;
    final rows = await db.query(
      'clients',
      where: 'id = ?',
      whereArgs: [clientId],
      limit: 1,
    );
    return rows.isEmpty ? null : _decode(rows.single);
  }
}
