import 'package:sqflite/sqflite.dart';
class DatabaseHelper{
  static DatabaseHelper? _databaseHelper;    
  DatabaseHelper._internal();
  static DatabaseHelper get instance => _databaseHelper ??= DatabaseHelper._internal();
  Database? _db;
  Database get db => _db!;
  Future<void> init() async {
    _db = await openDatabase('database.db', version: 1, onCreate: (db, version) {
      db.execute(' CREATE TABLE countries (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(255))');
    });
  }
  Future<void> clearTableAndResetId() async {
  final db = _db;
  if (db != null) {
    await db.transaction((txn) async {
      // Delete ALL
      await txn.rawDelete('DELETE FROM countries');
      // Reset  :)
      await txn.rawUpdate('DELETE FROM sqlite_sequence WHERE name = ?', ['countries']);
    });
  }
}
  Future<void> decreaseMaxId() async {
  final db = _db;
  if (db != null) {
    // Get the maximum ID
    final maxIdResult = await db.rawQuery('SELECT MAX(id) as max_id FROM countries');
    final maxId = maxIdResult.first['max_id'] as int? ?? 1;
    // Set the ID to maxId - 1
    await db.rawUpdate('UPDATE sqlite_sequence SET seq = ? WHERE name = ?', [maxId - 1, 'countries']);
  }
}
}