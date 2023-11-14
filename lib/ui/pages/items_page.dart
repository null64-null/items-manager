import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../templates/items_page_template.dart';
import '../../util/classes/items.dart';
import '../../db/basic_crud.dart';

final itemsProvider = StateProvider<List<Item>>((ref) {
  return [];
});

class ItemsPage extends ConsumerWidget {
  final String categoryType;
  final int categoryId;
  final String categoryName;

  const ItemsPage({
    Key? key,
    this.categoryType = "",
    this.categoryId = 0,
    this.categoryName = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);
    getData(categoryType, categoryId, ref);

    return ItemsPageTemplate(
      items: items,
      pageTitle: categoryName,
      categoryType: categoryType,
      categoryId: categoryId,
    );
  }
}

Future<void> getData(String categoryType, int categoryId, WidgetRef ref) async {
  final notifire = ref.read(itemsProvider.notifier);
  if (categoryType == "hikidashi") {
    final hikidashiId = categoryId;
    final selectedItems = await getItemsFromHikidashi(hikidashiId);
    notifire.state = selectedItems;
  }
  if (categoryType == "shoppingPlace") {
    final shopingPlaceId = categoryId;
    final selectedItems = await getItemsFromShoppingPlace(shopingPlaceId);
    notifire.state = selectedItems;
  }
}
