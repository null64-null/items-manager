import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> deleteCategoryId(int categoryId, String categoryType) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'items_storage_databases.db'),
  );
  if (categoryType == "hikidashi") {
    await db.update(
      "items",
      {'hikidashi_id': null},
      where: 'hikidashi_id = ?',
      whereArgs: [categoryId],
    );
  }
  if (categoryType == "shoppingPlace") {
    await db.update(
      "items",
      {'shopping_place_id': null},
      where: 'shopping_place_id = ?',
      whereArgs: [categoryId],
    );
  }
}
