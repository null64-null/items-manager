import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../atoms/app_bar.dart';
import '../organisms/categories_page/category_button.dart';
import '../organisms/categories_page/add_category_button.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';

const List<Category> initialCategorys = [
  Category(id: 0, name: "name", notifications: 0),
];

class CategoriesPageTemplate extends ConsumerWidget {
  final String categoryType;
  final List<Category> buttonItems;
  final Color appBarColor;
  final Color buttonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.categoryType = "",
    this.buttonItems = initialCategorys,
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
            children: [
              for (final buttonItem in buttonItems)
                CategoryButton(
                  buttonItem: buttonItem,
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

String title(String categoryType) {
  if (categoryType == "hikidashi") {
    return "ひきだし一覧";
  } else if (categoryType == "shoppingPlace") {
    return "買う場所一覧";
  } else {
    return "";
  }
}
