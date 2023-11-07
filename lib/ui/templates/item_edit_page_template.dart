import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/classes/items.dart';

class ItemEditPageTemplate extends ConsumerWidget {
  final int categoryId;
  final String categoryType;
  final Item? item;

  const ItemEditPageTemplate({
    Key? key,
    this.item,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    if (item == null) {
      return AppBar(
        title: const Text(
          "アイテムを追加",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: getColor(categoryType),
      );
    } else {
      return AppBar(
        title: Text(
          "item.name",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: getColor(categoryType),
      );
    }
  }
}

Color getColor(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return const Color(0xFF54D6FF);
    case "shoppingPlace":
      return const Color(0xFF62FF54);
    default:
      return Colors.white;
  }
}
