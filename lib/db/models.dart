import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './migrate.dart';

class Hikidashi {
  final int id;
  final String name;

  Hikidashi({required this.id, required this.name});

  Future<void> insertHikidashi(Hikidashi hikidashi) async {
    final Database db = await connectDatabase();
  }
}

class ShoppingPlace {
  final int id;
  final String name;

  ShoppingPlace({required this.id, required this.name});
}

class Item {
  final int id;
  final String name;
  final double remainingValue;
  final double maxValue;
  final String unit;
  final int? hikidashiId;
  final int? shoppingPlaceId;

  Item({
    required this.id,
    required this.name,
    required this.remainingValue,
    required this.maxValue,
    required this.unit,
    this.hikidashiId,
    this.shoppingPlaceId,
  });
}
