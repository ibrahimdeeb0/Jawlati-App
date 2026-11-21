import 'package:sqflite/sqflite.dart';

class FieldDatabase {
  FieldDatabase({String? path}) : _path = path;

  final String? _path;
  Future<Database>? _opening;

  Future<Database> get database => _opening ??= _open();

  Future<Database> _open() async {
    try {
      final path = _path ?? '${await getDatabasesPath()}/jawlati_field.db';
      return await openDatabase(
        path,
        version: 1,
        onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
        onCreate: (db, _) async {
          await db.execute(
            'CREATE TABLE clients (id TEXT PRIMARY KEY, payload TEXT NOT NULL)',
          );
          await db.execute('''CREATE TABLE visits (
              id TEXT PRIMARY KEY,
              client_id TEXT REFERENCES clients(id),
              salesman_id TEXT NOT NULL,
              check_in_time INTEGER NOT NULL,
              status TEXT NOT NULL CHECK(status IN ('checkedIn', 'checkedOut', 'cancelled')),
              payload TEXT NOT NULL
            )''');
          await db.execute(
            "CREATE UNIQUE INDEX active_visit_per_salesman "
            "ON visits(salesman_id) WHERE status = 'checkedIn'",
          );
          await db.execute(
            'CREATE TABLE field_metadata (key TEXT PRIMARY KEY)',
          );
        },
      );
    } catch (_) {
      _opening = null;
      rethrow;
    }
  }

  Future<void> close() async {
    final opening = _opening;
    _opening = null;
    if (opening != null) {
      await (await opening).close();
    }
  }
}
