import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../util/classes/category.dart';
import '../util/classes/items.dart';

// Hikidashi
// create
Future<String?> insertHikidashi(Category hikidashi) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.insert('hikidashis', hikidashi.toMap());
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// get (all)
Future<List<Category>> getHikidashis() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('hikidashis');
  final categories = List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
      notifications: maps[index]['notifications'],
    );
  });
  categories.add(const Category(name: "未分類"));
  return categories;
}

// edit
Future<String?> updateHikidashi(Category hikidashi) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.update(
      'hikidashis',
      hikidashi.toMap(),
      where: 'id = ?',
      whereArgs: [hikidashi.id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// delete
Future<String?> deleteHikidashi(int id) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.delete(
      'hikidashis',
      where: 'id = ?',
      whereArgs: [id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// shopping place
// create
Future<String?> insertShoppingPlace(Category shoppingPlace) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.insert('shopping_places', shoppingPlace.toMap());
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// get (all)
Future<List<Category>> getShoppingPlaces() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('shopping_places');
  final categories = List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
      notifications: maps[index]['notifications'],
    );
  });
  categories.add(const Category(name: "未分類"));
  return categories;
}

// edit
Future<String?> updateShoppingPlace(Category shoppingPlace) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.update(
      'shopping_places',
      shoppingPlace.toMap(),
      where: 'id = ?',
      whereArgs: [shoppingPlace.id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// delete
Future<String?> deleteShoppingPlace(int id) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.delete(
      'shopping_places',
      where: 'id = ?',
      whereArgs: [id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

//items
// create
Future<String?> insertItem(Item item) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.insert('items', item.toMap());
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// get (all)
Future<List<Item>> getItems() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('items');
  return List.generate(maps.length, (index) {
    return Item(
      id: maps[index]['id'],
      name: maps[index]['name'],
      remainingValue: maps[index]['remaining_value'],
      maxValue: maps[index]['max_value'],
      unit: maps[index]['unit'],
      hikidashiId: maps[index]['hikidashi_id'],
      shoppingPlaceId: maps[index]['shopping_place_id'],
    );
  });
}

// get (from hikidashis page)
Future<List<Item>> getItemsFromHikidashi(int? hikidashiId) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query(
    'items',
    where: hikidashiId == null ? 'hikidashi_id IS NULL' : 'hikidashi_id = ?',
    whereArgs: hikidashiId == null ? null : [hikidashiId],
  );
  return List.generate(maps.length, (index) {
    return Item(
      id: maps[index]['id'],
      name: maps[index]['name'],
      remainingValue: maps[index]['remaining_value'],
      maxValue: maps[index]['max_value'],
      unit: maps[index]['unit'],
      hikidashiId: maps[index]['hikidashi_id'],
      shoppingPlaceId: maps[index]['shopping_place_id'],
    );
  });
}

// get (from shopping place page)
Future<List<Item>> getItemsFromShoppingPlace(int? shoppingPlaceId) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'zaiko_databases.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query(
    'items',
    where: shoppingPlaceId == null
        ? 'shopping_place_id IS NULL'
        : 'shopping_place_id = ?',
    whereArgs: shoppingPlaceId == null ? null : [shoppingPlaceId],
  );
  return List.generate(maps.length, (index) {
    return Item(
      id: maps[index]['id'],
      name: maps[index]['name'],
      remainingValue: maps[index]['remaining_value'],
      maxValue: maps[index]['max_value'],
      unit: maps[index]['unit'],
      hikidashiId: maps[index]['hikidashi_id'],
      shoppingPlaceId: maps[index]['shopping_place_id'],
    );
  });
}

// edit
Future<String?> updateItem(Item item) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}

// delete
Future<String?> deleteItem(int id) async {
  try {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'zaiko_databases.db'),
    );
    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
    return null;
  } catch (e) {
    return '保存に失敗しました : $e';
  }
}
