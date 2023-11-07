import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/templates/categories_page_template.dart';
import '../../db/crud.dart';
import '../../util/classes/category.dart';

List<Category> nothig = [
  const Category(id: 1, name: "", notifications: 0),
];

final categoriesProvider = StateProvider<List<Category>>((ref) {
  return [];
});

class CategoriesListPage extends ConsumerWidget {
  final String categoryType;

  const CategoriesListPage({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    getData(categoryType, ref);

    return CategoriesPageTemplate(
      pageTitle: getTitle(categoryType),
      categoryType: categoryType,
      buttonItems: categories,
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

String getTitle(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return "おうちのひきだし";
    case "shoppingPlace":
      return "かいものリスト";
    default:
      return "";
  }
}

Color getColor(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return const Color(0xFF54D6FF);
    case "shoppingPlace":
      return const Color(0xFF62FF54);
    default:
      return Colors.white;
  }
}
