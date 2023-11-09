import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../organisms/item_status/item_status.dart';
import '../organisms/button/items_page/add_item_button.dart';
import '../../util/classes/items.dart';

class ItemsPageTemplate extends ConsumerWidget {
  final String pageTitle;
  final String categoryType;
  final int categoryId;
  final List<Item>? items;

  const ItemsPageTemplate({
    Key? key,
    this.pageTitle = "",
    this.categoryType = "",
    this.categoryId = 0,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(pageTitle, categoryType),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              for (final item in items ?? [])
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ItemStatus(
                        item: item,
                        categoryType: categoryType,
                        categoryId: categoryId,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddItemButton(categoryType: categoryType),
    );
  }
}

AppBar appBar(String pageTitle, String categoryType) {
  return AppBar(
    title: Text(
      pageTitle,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: getColor(categoryType),
  );
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
