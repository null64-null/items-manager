import 'package:flutter/material.dart';
import './../templates/items_list_page_template.dart';

// dummy data, 後にAPI通信でデータ取得
// API：買い物が必要なアイテム数を引き出しごとに取得
List<ItemStatusItem> statusItems = [
  const ItemStatusItem(
    id: 1,
    itemName: "にんじん",
    remainingValue: 1,
    maxValue: 5,
    unit: "本",
  ),
  const ItemStatusItem(
    id: 2,
    itemName: "キャベツ",
    remainingValue: 0.5,
    maxValue: 1,
    unit: "個",
  ),
  const ItemStatusItem(
    id: 3,
    itemName: "豆腐",
    remainingValue: 2,
    maxValue: 4,
    unit: "個",
  ),
  const ItemStatusItem(
    id: 4,
    itemName: "納豆",
    remainingValue: 2,
    maxValue: 12,
    unit: "パック",
  ),
  const ItemStatusItem(
    id: 5,
    itemName: "小松菜",
    remainingValue: 0.2,
    maxValue: 1,
    unit: "袋",
  ),
  const ItemStatusItem(
    id: 6,
    itemName: "なす",
    remainingValue: 3,
    maxValue: 5,
    unit: "本",
  ),
];

class ItemListPageFromHikidashiList extends StatelessWidget {
  final int hikidashiId;
  final String hikidashiName;

  const ItemListPageFromHikidashiList({
    Key? key,
    this.hikidashiId = 0,
    this.hikidashiName = "hikidashi",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemsListPageTemplate(
      pageTitle: hikidashiName,
      appBarColor: Colors.yellow,
      itemStatusItems: statusItems,
    );
  }

  // 該当のhikidashiIdの引き出しにある買い物アイテムデータを取得
  // dummy dataは上に仮置きしている
  void dataFetch(int hikidashiId) {
    debugPrint(hikidashiName);
    debugPrint(hikidashiId.toString());
  }
}
