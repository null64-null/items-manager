import 'package:flutter/material.dart';
import './models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> insertHikidashi(Hikidashi hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.insert('hikidashis', hikidashi.toMap());
}

Future<List<Hikidashi>> getHikidashi() async {
  debugPrint("get start");
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('hikidashis');
  debugPrint(maps.toString());
  return List.generate(maps.length, (index) {
    return Hikidashi(
      id: maps[index]['id'],
      name: maps[index]['name'],
    );
  });
}
