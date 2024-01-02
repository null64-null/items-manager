import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../util/classes/category.dart';
import '../util/classes/items.dart';

// Hikidashi
// create
Future<void> insertHikidashi(Category hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.insert('hikidashis', hikidashi.toMap());
}

// create　multiple
Future<void> insertHikidashis(List<Category> hikidashis) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );

  await db.transaction((txn) async {
    for (var hikidashi in hikidashis) {
      await txn.insert('hikidashis', hikidashi.toMap());
    }
  });
}

// get (all)
Future<List<Category>> getHikidashis() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('hikidashis');
  final categories = List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
      num: maps[index]['num'],
    );
  });
  List<Category> sortedCategories = [];
  for (int i = 0; i < categories.length; i++) {
    Category? sortedCategory =
        categories.firstWhere((category) => category.num == i);
    sortedCategories.add(sortedCategory);
  }
  sortedCategories.add(const Category(name: "未分類"));
  return sortedCategories;
}

// edit
Future<void> updateHikidashi(Category hikidashi) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
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
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'hikidashis',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// delete all
Future<void> deleteAllHikidashi() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete('hikidashis');
}

// delete (select)
Future<void> deleteHikidashis(List<int> ids) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'hikidashis',
    where: 'id IN (${ids.map((_) => '?').join(', ')})',
    whereArgs: ids,
  );
}

// shopping place
// create
Future<void> insertShoppingPlace(Category shoppingPlace) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.insert('shopping_places', shoppingPlace.toMap());
}

// create　multiple
Future<void> insertShoppingPlaces(List<Category> shoppingPlaces) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );

  await db.transaction((txn) async {
    for (var shoppingPlace in shoppingPlaces) {
      await txn.insert('shoppingPlaces', shoppingPlace.toMap());
    }
  });
}

// get (all)
Future<List<Category>> getShoppingPlaces() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query('shopping_places');
  final categories = List.generate(maps.length, (index) {
    return Category(
      id: maps[index]['id'],
      name: maps[index]['name'],
      num: maps[index]['num'],
    );
  });

  List<Category> sortedCategories = [];
  for (int i = 0; i < categories.length; i++) {
    Category? sortedCategory =
        categories.firstWhere((category) => category.num == i);
    sortedCategories.add(sortedCategory);
  }
  sortedCategories.add(const Category(name: "未分類"));
  return sortedCategories;
}

// edit
Future<void> updateShoppingPlace(Category shoppingPlace) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
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
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'shopping_places',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// delete all
Future<void> deleteAllShoppingPlace() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete('shopping_places');
}

// delete (select)
Future<void> deleteShoppingPlaces(List<int> ids) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'shopping_places',
    where: 'id IN (${ids.map((_) => '?').join(', ')})',
    whereArgs: ids,
  );
}

//items
// create
Future<void> insertItem(Item item) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.insert('items', item.toMap());
}

// create multiple
Future<void> insertItems(List<Item> items) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );

  await db.transaction((txn) async {
    Batch batch = txn.batch();
    for (var item in items) {
      batch.insert('items', item.toMap());
    }
    await batch.commit(noResult: true);
  });
}

// get (all)
Future<List<Item>> getItems() async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
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
    join(await getDatabasesPath(), 'test19.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query(
    'items',
    where: hikidashiId == null ? 'hikidashi_id IS NULL' : 'hikidashi_id = ?',
    whereArgs: hikidashiId == null ? null : [hikidashiId],
  );
  List<Item> items = List.generate(maps.length, (index) {
    return Item(
      id: maps[index]['id'],
      name: maps[index]['name'],
      remainingValue: maps[index]['remaining_value'],
      maxValue: maps[index]['max_value'],
      unit: maps[index]['unit'],
      hikidashiId: maps[index]['hikidashi_id'],
      shoppingPlaceId: maps[index]['shopping_place_id'],
      hikidashiNum: maps[index]['hikidashi_num'],
      shoppingPlaceNum: maps[index]['shopping_place_num'],
    );
  });
  List<Item> sortedItems = [];

  // error checker (chack num)
  debugPrint("==============");
  debugPrint("items length : " + items.length.toString());
  for (int i = 0; i < items.length; i++) {
    debugPrint("==============");
    debugPrint("index : " + i.toString());
    debugPrint("name : " + items[i].name);
    debugPrint("hikidashiId : " + items[i].hikidashiId.toString());
    debugPrint("shoppingPlaceId : " + items[i].shoppingPlaceId.toString());
    debugPrint("hikidashiNum : " + items[i].hikidashiNum.toString());
    debugPrint("shoppingPlaceNum : " + items[i].shoppingPlaceNum.toString());
    debugPrint("==============");
  }
  debugPrint("==============");

  for (int i = 0; i < items.length; i++) {
    Item? sortedItem = items.firstWhere((item) => item.hikidashiNum == i);
    sortedItems.add(sortedItem);
  }

  return sortedItems;
}

// get (from shopping place page)
Future<List<Item>> getItemsFromShoppingPlace(int? shoppingPlaceId) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  final List<Map<String, dynamic>> maps = await db.query(
    'items',
    where: shoppingPlaceId == null
        ? 'shopping_place_id IS NULL'
        : 'shopping_place_id = ?',
    whereArgs: shoppingPlaceId == null ? null : [shoppingPlaceId],
  );

  List<Item> items = List.generate(maps.length, (index) {
    return Item(
      id: maps[index]['id'],
      name: maps[index]['name'],
      remainingValue: maps[index]['remaining_value'],
      maxValue: maps[index]['max_value'],
      unit: maps[index]['unit'],
      hikidashiId: maps[index]['hikidashi_id'],
      shoppingPlaceId: maps[index]['shopping_place_id'],
      hikidashiNum: maps[index]['hikidashi_num'],
      shoppingPlaceNum: maps[index]['shopping_place_num'],
    );
  });

  // error checker (chack num)
  debugPrint("==============");
  debugPrint("items length : " + items.length.toString());
  for (int i = 0; i < items.length; i++) {
    debugPrint("==============");
    debugPrint("index : " + i.toString());
    debugPrint("name : " + items[i].name);
    debugPrint("hikidashiId : " + items[i].hikidashiId.toString());
    debugPrint("shoppingPlaceId : " + items[i].shoppingPlaceId.toString());
    debugPrint("hikidashiNum : " + items[i].hikidashiNum.toString());
    debugPrint("shoppingPlaceNum : " + items[i].shoppingPlaceNum.toString());
    debugPrint("==============");
  }
  debugPrint("==============");

  List<Item> sortedItems = [];
  for (int i = 0; i < items.length; i++) {
    Item? sortedItem = items.firstWhere((item) => item.shoppingPlaceNum == i);
    sortedItems.add(sortedItem);
  }

  return sortedItems;
}

// edit
Future<void> updateItem(Item item) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.update(
    'items',
    item.toMap(),
    where: 'id = ?',
    whereArgs: [item.id],
  );

  // error checker (chack num)
  debugPrint("==============");
  debugPrint("update : name : " + item.name);
  debugPrint("update : hikidashiId : " + item.hikidashiId.toString());
  debugPrint("update : shoppingPlaceId : " + item.shoppingPlaceId.toString());
  debugPrint("update : hikidashiNum : " + item.hikidashiNum.toString());
  debugPrint("update : shoppingPlaceNum : " + item.shoppingPlaceNum.toString());
  debugPrint("==============");
}

// delete
Future<void> deleteItem(int id) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'items',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// delete (select)
Future<void> deleteItems(List<int> ids) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test19.db'),
  );
  await db.delete(
    'items',
    where: 'id IN (${ids.map((_) => '?').join(', ')})',
    whereArgs: ids,
  );
}
