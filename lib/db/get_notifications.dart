import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../util/classes/category.dart';

Future<List<int>> getNotifications(
  List<Category> categories,
  String categoryType,
) async {
  List<int> notifications = [];

  for (final category in categories) {
    if (categoryType == "hikidashi") {
      final notification = await countNotificationsHikidashi(category.id, 0.3);
      notifications.add(notification);
    }

    if (categoryType == "shoppingPlace") {
      final notification =
          await countNotificationsShoppingPlace(category.id, 0.3);
      notifications.add(notification);
    }
  }

  return notifications;
}

Future<int> countNotificationsHikidashi(
  int? hikidashiId,
  double threshold,
) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test2.db'),
  );

  if (hikidashiId == null) {
    const query = '''
      SELECT COUNT(*) FROM items
      WHERE hikidashi_id IS NULL AND remaining_value / max_value <= ?
    ''';
    final List<Map<String, dynamic>> result = await db.rawQuery(
      query,
      [threshold],
    );
    final int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  } else {
    const query = '''
      SELECT COUNT(*) FROM items
      WHERE hikidashi_id = ? AND remaining_value / max_value <= ?
    ''';
    final List<Map<String, dynamic>> result = await db.rawQuery(
      query,
      [hikidashiId, threshold],
    );
    final int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }
}

Future<int> countNotificationsShoppingPlace(
  int? shoppingPlaceId,
  double threshold,
) async {
  final Database db = await openDatabase(
    join(await getDatabasesPath(), 'test2.db'),
  );

  if (shoppingPlaceId == null) {
    const query = '''
      SELECT COUNT(*) FROM items
      WHERE shopping_place_id IS NULL AND remaining_value / max_value <= ?
    ''';
    final List<Map<String, dynamic>> result = await db.rawQuery(
      query,
      [threshold],
    );
    final int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  } else {
    const query = '''
      SELECT COUNT(*) FROM items
      WHERE shopping_place_id = ? AND remaining_value / max_value <= ?
    ''';
    final List<Map<String, dynamic>> result = await db.rawQuery(
      query,
      [shoppingPlaceId, threshold],
    );
    final int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }
}
