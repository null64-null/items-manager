import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../atoms/app_bar.dart';
import '../organisms/categories_page/category_button.dart';
import '../organisms/categories_page/add_category_button.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/values_dart/initial_values.dart';

class CategoriesPageTemplate extends ConsumerWidget {
  final String categoryType;
  final List<Category> categories;
  final List<int> notificationsArray;
  final Color appBarColor;
  final Color buttonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.categoryType = "",
    this.categories = categoriesInit,
    this.notificationsArray = const [],
    this.appBarColor = Colors.white,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title(categoryType),
        color: getColor(categoryType),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(categories.length, (index) {
              final category = categories[index];
              final notifications = notificationsArray[index];
              return CategoryButton(
                category: category,
                categoryType: categoryType,
                notifications: notifications,
              );
            }),
          )
        ],
      ),
      floatingActionButton: AddCategoryButton(
        categoryType: categoryType,
        itemsLength: categories.length,
      ),
    );
  }
}

String title(String categoryType) {
  if (categoryType == "hikidashi") {
    return "ひきだし一覧";
  } else if (categoryType == "shoppingPlace") {
    return "買う場所一覧";
  } else {
    return "";
  }
}
