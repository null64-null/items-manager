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
  final List<ItemStatusItem> itemStatusItems;

  const ItemsListPageTemplate({
    Key? key,
    this.pageTitle = "title",
    this.appBarColor = Colors.white,
    this.itemStatusItems = initialItemStatusItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: appBarColor,
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: ElevatedButton(
          child: const Text(
            "新規作成",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            debugPrint("add");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              for (final itemStatusItem in itemStatusItems)
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ItemStatus(
                        id: itemStatusItem.id,
                        itemName: itemStatusItem.itemName,
                        remainingValue: itemStatusItem.remainingValue,
                        maxValue: itemStatusItem.maxValue,
                        unit: itemStatusItem.unit,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
for (final itemStatusItem in itemStatusItems)
  ItemStatus(
    id: itemStatusItem.id,
    itemName: itemStatusItem.itemName,
    remainingValue: itemStatusItem.remainingValue,
    maxValue: itemStatusItem.maxValue,
    unit: itemStatusItem.unit,
  ),
*/

/*
SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ItemStatus(
                id: itemStatusItems[index].id,
                itemName: itemStatusItems[index].itemName,
                remainingValue: itemStatusItems[index].remainingValue,
                maxValue: itemStatusItems[index].maxValue,
                unit: itemStatusItems[index].unit,
              );
            }),
          ),

*/