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
    return FutureBuilder<void>(
      future: fetchData(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final categories = ref.watch(categoriesProvider);
          final notificationsArray = ref.watch(notificationsArrayProvider);

          return CategoriesPageTemplate(
            categoryType: categoryType,
            categories: categories,
            notificationsArray: notificationsArray,
            appBarColor: getColor(categoryType),
            buttonColor: getColor(categoryType),
          );
        }
      },
    );
  }

  Future<void> fetchData(WidgetRef ref) async {
    switch (categoryType) {
      case "hikidashi":
        final hikidashiCategorys = await getHikidashis();
        final notifier = ref.read(categoriesProvider.notifier);
        notifier.state = hikidashiCategorys;
        break;
      case "shoppingPlace":
        final shoppingPlaceCategorys = await getShoppingPlaces();
        final notifier = ref.read(categoriesProvider.notifier);
        notifier.state = shoppingPlaceCategorys;
        break;
      default:
        debugPrint("category type error");
    }

    final categories = ref.watch(categoriesProvider);
    final notifier = ref.read(notificationsArrayProvider.notifier);
    notifier.state = await getNotifications(categories, categoryType);
  }
}

Future<void> getData(String categoryType, WidgetRef ref) async {
  switch (categoryType) {
    case "hikidashi":
      final hikidashiCategorys = await getHikidashis();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = hikidashiCategorys;
      break;
    case "shoppingPlace":
      final shoppingPlaceCategorys = await getShoppingPlaces();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = shoppingPlaceCategorys;
      break;
    default:
      debugPrint("category type error");
  }
}
