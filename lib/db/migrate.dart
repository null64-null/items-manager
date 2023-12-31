import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> initializeDatabase() async {
  debugPrint("Database intialize start");
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'test2.db'),
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE hikidashis ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "num INTEGER"
        ");",
      );
      await db.execute(
        "CREATE TABLE shopping_places ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "num INTEGER"
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
        "hikidashi_num INTEGER,"
        "shopping_place_num INTEGER,"
        "FOREIGN KEY (hikidashi_id) REFERENCES hikidashis(id),"
        "FOREIGN KEY (shopping_place_id) REFERENCES shopping_places(id)"
        ");",
      );
      debugPrint("Database initialized");
    },
    version: 1,
  );
  debugPrint("Database intialize end");
  await database;
}
