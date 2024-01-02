import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './loading/loading_page.dart';
import './loading/loading_error_page.dart';
import '../templates/items_page_template.dart';
import '../../util/classes/items.dart';
import '../../util/values/initial_values.dart';
import '../../util/functions/get_color.dart';
import '../../util/functions/get_title.dart';
import '../../db/basic_crud.dart';

final itemsProvider = StateProvider<List<Item>>((ref) {
  return itemsInit;
});

class ItemsPage extends ConsumerWidget {
  final String categoryType;
  final int? categoryId;
  final String categoryName;

  const ItemsPage({
    Key? key,
    this.categoryType = "",
    this.categoryId,
    this.categoryName = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<void>(
      future: fetchData(
        categoryType: categoryType,
        categoryId: categoryId,
        ref: ref,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage(
            title: getTitle(categoryType),
            appBarColor: getColor(categoryType),
            indicatorColor: getDarkColor(categoryType),
          );
        } else if (snapshot.hasError) {
          return LoadingErrorPage(
            title: getTitle(categoryType),
            appBarColor: getColor(categoryType),
            errorMessage: 'Error: ${snapshot.error}',
          );
        } else {
          final items = ref.watch(itemsProvider);

          return ItemsPageTemplate(
            items: items,
            pageTitle: categoryName,
            categoryType: categoryType,
            categoryId: categoryId,
          );
        }
      },
    );
  }
}

Future<void> fetchData({
  required String categoryType,
  int? categoryId,
  required WidgetRef ref,
}) async {
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
