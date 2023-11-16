import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/templates/categories_page_template.dart';
import '../../db/basic_crud.dart';
import '../../db/category_notification_setting.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/values.dart/initial_values.dart';

final categoriesProvider = StateProvider<List<Category>>((ref) {
  return categoriesInit;
});

final notificationsArrayProvider = StateProvider<List<int>>((ref) {
  return [];
});

class CategoriesPage extends ConsumerWidget {
  final String categoryType;

  const CategoriesPage({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final notificationsArray = ref.watch(notificationsArrayProvider);
    getData(categoryType, ref);
    getNotificationsArray(categories, categoryType, ref);

    return CategoriesPageTemplate(
      categoryType: categoryType,
      categories: categories,
      notificationsArray: notificationsArray,
      appBarColor: getColor(categoryType),
      buttonColor: getColor(categoryType),
    );
  }
}

Future<void> getData(String categoryType, WidgetRef ref) async {
  switch (categoryType) {
    case "hikidashi":
      final hikidashiCategorys = await getHikidashis();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = hikidashiCategorys;
    case "shoppingPlace":
      final shoppingPlaceCategorys = await getShoppingPlaces();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = shoppingPlaceCategorys;
    default:
      debugPrint("category type error");
  }
}

Future<void> getNotificationsArray(
  List<Category> categories,
  String categoryType,
  WidgetRef ref,
) async {
  final notifire = ref.read(notificationsArrayProvider.notifier);
  notifire.state = await getNotifications(categories, categoryType);
}
