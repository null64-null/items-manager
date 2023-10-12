import 'package:flutter/material.dart';

class Item {
  final int? id;
  final String name;
  final double remainingValue;
  final double maxValue;
  final String unit;
  final int? hikidashiId;
  final int? shoppingPlaceId;

  Item({
    this.id,
    required this.name,
    required this.remainingValue,
    required this.maxValue,
    required this.unit,
    this.hikidashiId,
    this.shoppingPlaceId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'remaining_value': remainingValue,
      'max_value': maxValue,
      'unit': unit,
      'hikidashi_id': hikidashiId,
      'shopping_place_id': shoppingPlaceId,
    };
  }
}
