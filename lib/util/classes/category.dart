import 'package:flutter/material.dart';

class Category {
  final int? id;
  final String name;
  final int? notifications;

  const Category({
    this.id,
    required this.name,
    this.notifications,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'notifications': notifications,
    };
  }
}
