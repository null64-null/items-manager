import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/classes/items.dart';

const Item initialItem = Item(
  name: "",
  remainingValue: 0,
  maxValue: 0,
  unit: "",
);

final itemEditProvider = StateProvider<Item>((ref) {
  return initialItem;
});

class ItemEditPageTemplate extends ConsumerWidget {
  final int categoryId;
  final String categoryType;

  const ItemEditPageTemplate({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemEdit = ref.watch(itemEditProvider);

    return Scaffold(
      appBar: appBar(itemEdit, categoryType),
    );
  }
}

AppBar appBar(Item item, String categoryType) {
  return AppBar(
    title: Text(
      item.name == "" ? "アイテムを追加" : item.name,
      style: titleStyle,
    ),
    backgroundColor: getColor(categoryType),
  );
}

TextStyle titleStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

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
