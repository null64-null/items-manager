import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../util/classes/category.dart';

// Hikidashi
// create
Future<void> insertHikidashi(Category hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.insert('hikidashis', hikidashi.toMap());
}

// get (all)
Future<List<Category>> getHikidashis() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('hikidashis');
  return List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
    );
  });
}

// edit
Future<void> updateHikidashi(Category hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.update(
    'hikidashis',
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
    'hikidashis',
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

// shopping place
// create
Future<void> insertShoppingPlace(Category shoppingPlace) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.insert('shopping_places', shoppingPlace.toMap());
}

// get (all)
Future<List<Category>> getShoppingPlaces() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('shopping_places');
  return List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
    );
  });
}

// edit
Future<void> updateShoppingPlace(Category shoppingPlace) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.update(
    'shopping_places',
    shoppingPlace.toMap(),
    where: 'id = ?',
    whereArgs: [shoppingPlace.id],
  );
}

// delete
Future<void> deleteShoppingPlace(int id) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.delete(
    'shopping_places',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// delete (select)
Future<void> deleteShoppingPlaces(List<int> ids) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  await db.delete(
    'shopping_places',
    where: 'id IN (${ids.map((_) => '?').join(', ')})',
    whereArgs: ids,
  );
}
