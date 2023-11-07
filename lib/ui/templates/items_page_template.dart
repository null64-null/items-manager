import 'package:flutter/material.dart';
import '../organisms/item_status/item_status.dart';
import '../../util/classes/items.dart';

class ItemsPageTemplate extends StatelessWidget {
  final String pageTitle;
  final Color appBarColor;
  final List<Item>? items;

  const ItemsPageTemplate({
    Key? key,
    this.pageTitle = "title",
    this.appBarColor = Colors.white,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: appBarColor,
      ),
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
      bottomNavigationBar: SizedBox(
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
    );
  }
}
