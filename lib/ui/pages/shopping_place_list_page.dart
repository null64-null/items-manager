import 'package:flutter/material.dart';
import 'package:test_app/ui/templates/categories_page_template.dart';

// dummy data, 後にAPI通信でデータ取得
// API：買い物が必要になったアイテム数をショップごとに取得
List<ButtonItem> buttonItems = [
  const ButtonItem(id: 1, name: "業スー", notifications: 1),
  const ButtonItem(id: 2, name: "ベルクス", notifications: 0),
  const ButtonItem(id: 3, name: "オーケー", notifications: 2),
  const ButtonItem(id: 4, name: "セイムズ", notifications: 2),
  const ButtonItem(id: 5, name: "楽天市場", notifications: 0),
];

class ShoppingPlaceListPage extends StatelessWidget {
  const ShoppingPlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesPageTemplate(
      pageTitle: "かいものリスト",
      pageType: "shoppingPlace",
      buttonItems: buttonItems,
      appBarColor: const Color(0xFF62FF54),
      boxButtonColor: const Color(0xFF62FF54),
    );
  }
}
