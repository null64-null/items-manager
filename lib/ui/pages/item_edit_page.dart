import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../templates/item_edit_page_template.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';
import '../../util/values.dart/initial_values.dart';
import '../../db/basic_crud.dart';

final hikidashiOptinsProvider = StateProvider<List<Category>>((ref) {
  return categoriesInit;
});

final shoppingPlaceOptinsProvider = StateProvider<List<Category>>((ref) {
  return categoriesInit;
});

class ItemEditPage extends ConsumerWidget {
  final Item? initialItem;
  final int categoryId;
  final String categoryType;

  const ItemEditPage({
    Key? key,
    this.initialItem,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getHikidashOptins(ref);
    getShoppingPlaceOptins(ref);

    return ItemEditPageTemplate(
      initialItem: initialItem,
      categoryId: categoryId,
      categoryType: categoryType,
    );
  }
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
