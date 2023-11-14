import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../atoms/app_bar.dart';
import '../organisms/item_status/item_status.dart';
import '../organisms/button/items_page/add_item_button.dart';
import '../../util/classes/items.dart';
import '../../util/functions/get_color.dart';

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
      appBar: CustomAppBar(
        title: pageTitle,
        color: getColor(categoryType),
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
      floatingActionButton: AddItemButton(
        categoryType: categoryType,
        categoryId: categoryId,
      ),
    );
  }
}
