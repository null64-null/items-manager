import 'package:flutter/material.dart';
import '../../ui/pages/items_list_page.dart';
import '../../ui/pages/start_page.dart';

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

  void onPressed(context, String buttonType) {
    final dynamic page;

    switch (buttonType) {
      case "hikidashi":
        page = ItemsListPage(
          categoryType: "hikidashi",
          categoryId: id ?? 0,
          categoryName: name,
        );
        break;
      case "shoppingPlace":
        page = ItemsListPage(
          categoryType: "shoppingPlace",
          categoryId: id ?? 0,
          categoryName: name,
        );
        break;
      default:
        page = const StartPage();
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
