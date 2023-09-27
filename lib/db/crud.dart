import 'package:flutter/material.dart';
import './models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Hikidashi
// create
Future<void> insertHikidashi(Hikidashi hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.insert('hikidashis', hikidashi.toMap());
}

// get (all)
Future<List<Hikidashi>> getHikidashi() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('hikidashis');
  return List.generate(maps.length, (index) {
    return Hikidashi(
      id: maps[index]['id'],
      name: maps[index]['name'],
    );
  });
}

// edit
Future<void> updateHikidashi(Hikidashi hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.update(
    'zaiko_databases.db',
    hikidashi.toMap(),
    where: 'id = ?',
    whereArgs: [hikidashi.id],
  );
}

// delete
Future<void> deleteHikidashi(int id) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.delete(
    'zaiko_databases.db',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// delete (select)
Future<void> deleteHikidashis(List<int> ids) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.delete(
    'zaiko_databases.db',
    where: 'id IN (${ids.map((_) => '?').join(', ')})',
    whereArgs: ids,
  );
}
