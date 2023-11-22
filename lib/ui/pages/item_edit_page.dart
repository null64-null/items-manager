import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'loading/loading_page.dart';
import './loading_error_page.dart';
import '../templates/item_edit_page_template.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/functions/get_title.dart';
import '../../util/values.dart/initial_values.dart';
import '../../db/basic_crud.dart';

final hikidashiOptinsProvider = StateProvider<List<Category>>((ref) {
  return categoriesInit;
});

final shoppingPlaceOptinsProvider = StateProvider<List<Category>>((ref) {
  return categoriesInit;
});

class ItemEditPage extends ConsumerWidget {
  final Item initialItem;
  final int categoryId;
  final String categoryType;

  const ItemEditPage({
    Key? key,
    this.initialItem = itemInit,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<void>(
      future: fetchData(ref),
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
          return ItemEditPageTemplate(
            initialItem: initialItem,
            categoryId: categoryId,
            categoryType: categoryType,
          );
        }
      },
    );
  }

  Future<void> fetchData(WidgetRef ref) async {
    await getHikidashOptins(ref);
    await getShoppingPlaceOptins(ref);
  }

  Future<void> getHikidashOptins(WidgetRef ref) async {
    final hikidashiOptinos = await getHikidashis();
    final notifire = ref.read(hikidashiOptinsProvider.notifier);
    notifire.state = hikidashiOptinos;
  }

  Future<void> getShoppingPlaceOptins(WidgetRef ref) async {
    final shoppingPlaceOptinos = await getShoppingPlaces();
    final notifire = ref.read(shoppingPlaceOptinsProvider.notifier);
    notifire.state = shoppingPlaceOptinos;
  }
}
