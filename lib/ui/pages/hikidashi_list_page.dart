import 'package:flutter/material.dart';
import 'package:test_app/ui/templates/box_buttons_page_template.dart';

// dummy data, 後にAPI通信でデータ取得
// API：買い物が必要になったアイテム数を引き出しごとに取得
List<ButtonItem> buttonItems = [
  const ButtonItem(id: 1, name: "冷蔵庫", notifications: 1),
  const ButtonItem(id: 2, name: "冷凍庫", notifications: 0),
  const ButtonItem(id: 3, name: "野菜室", notifications: 0),
  const ButtonItem(id: 4, name: "調味料棚", notifications: 2),
  const ButtonItem(id: 5, name: "日用品", notifications: 2),
  const ButtonItem(id: 6, name: "その他", notifications: 1),
];

class HikidashiListPage extends StatelessWidget {
  const HikidashiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BoxButtonsPageTemplate(
      pageTitle: "おうちのひきだし",
      buttonItems: buttonItems,
      appBarColor: Colors.blue,
      boxButtonColor: Colors.blue,
    );
  }
}
