import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../organisms/button/categorys_page/category_button.dart';
import '../../util/classes/category.dart';
import '../organisms/button/categorys_page/add_category_button.dart';

const List<Category> initialCategorys = [
  Category(id: 0, name: "name", notifications: 0),
];

class CategoriesPageTemplate extends ConsumerWidget {
  final String pageTitle;
  final String categoryType;
  final List<Category> buttonItems;
  final Color appBarColor;
  final Color buttonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.pageTitle = 'title',
    this.categoryType = "",
    this.buttonItems = initialCategorys,
    this.appBarColor = Colors.white,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTitleText(pageTitle),
        backgroundColor: appBarColor,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              for (final buttonItem in buttonItems)
                CategoryButton(
                  buttonItem: buttonItem,
                  buttonColor: buttonColor,
                  categoryType: categoryType,
                )
            ],
          )
        ],
      ),
      floatingActionButton: AddCategoryButton(
        categoryType: categoryType,
        itemsLength: buttonItems.length,
      ),
    );
  }
}

Widget appbarTitleText(String pageTitle) {
  return (Text(
    pageTitle,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ));
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
