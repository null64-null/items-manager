import 'package:flutter/material.dart';
import 'package:test_app/ui/templates/box_buttons_page_template.dart';

// dummy data, 後にAPI通信でデータ取得
// API：買い物が必要になったアイテム数をショップごとに取得
List<ButtonItem> buttonItems = [
  const ButtonItem(name: "業スー", notifications: 1),
  const ButtonItem(name: "ベルクス", notifications: 0),
  const ButtonItem(name: "オーケー", notifications: 2),
  const ButtonItem(name: "セイムズ", notifications: 2),
  const ButtonItem(name: "楽天市場", notifications: 0),
];

class ShoppingPlaceListPage extends StatelessWidget {
  const ShoppingPlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BoxButtonsPageTemplate(
      pageTitle: "ショップリスト",
      buttonItems: buttonItems,
      appBarColor: Colors.lightGreen,
      boxButtonColor: Colors.lightGreen,
    );
  }
}
