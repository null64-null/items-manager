import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> connectDatabase() async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE hikidashis ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT"
        ");",
      );
      await db.execute(
        "CREATE TABLE shopping_places ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT"
        ");",
      );
      await db.execute(
        "CREATE TABLE items("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "remaining_value REAL,"
        "max_value REAL,"
        "unit TEXT,"
        "hikidashi_id INTEGER,"
        "shopping_place_id INTEGER,"
        "FOREIGN KEY (hikidashi_id) REFERENCES hikidashis(id),"
        "FOREIGN KEY (shopping_place_id) REFERENCES shopping_places(id)"
        ");",
      );
    },
    version: 1,
  );
  return database;
}
