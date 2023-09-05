import 'package:flutter/material.dart';
import './../organisms/item_status.dart';

class ItemStatusItem {
  final int id;
  final String itemName;
  final double remainingValue;
  final double maxValue;
  final String unit;

  const ItemStatusItem({
    required this.id,
    required this.itemName,
    required this.remainingValue,
    required this.maxValue,
    required this.unit,
  });
}

const List<ItemStatusItem> initialItemStatusItems = [
  ItemStatusItem(
    id: 0,
    itemName: "name",
    remainingValue: 1,
    maxValue: 1,
    unit: "unit",
  ),
];

class ItemsListPageTemplate extends StatelessWidget {
  final String pageTitle;
  final Color appBarColor;
  final List<ItemStatusItem> itemStatusItem;

  const ItemsListPageTemplate({
    Key? key,
    this.pageTitle = "title",
    this.appBarColor = Colors.white,
    this.itemStatusItem = initialItemStatusItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void pageTransition(int id) {
    debugPrint(id.toString());
  }
}
