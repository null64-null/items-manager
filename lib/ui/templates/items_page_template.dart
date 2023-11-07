import 'package:flutter/material.dart';
import '../organisms/item_status/item_status.dart';
import '../organisms/button/items_page/add_item_button.dart';
import '../../util/classes/items.dart';

class ItemsPageTemplate extends StatelessWidget {
  final String pageTitle;
  final String categoryType;
  final Color appBarColor;
  final List<Item>? items;

  const ItemsPageTemplate({
    Key? key,
    this.pageTitle = "",
    this.categoryType = "",
    this.appBarColor = Colors.white,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(pageTitle, appBarColor),
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
                        id: item.id ?? 0,
                        itemName: item.name,
                        remainingValue: item.remainingValue,
                        maxValue: item.maxValue,
                        unit: item.unit,
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

AppBar appBar(String pageTitle, Color color) {
  return AppBar(
    title: Text(
      pageTitle,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: color,
  );
}
