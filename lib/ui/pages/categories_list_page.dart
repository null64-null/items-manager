import 'package:flutter/material.dart';
import 'package:test_app/ui/templates/categories_page_template.dart';
import '../../util/dummy_data.dart';
import '../../db/crud.dart';
import '../../util/classes/category.dart';

List<Category> nothig = [
  const Category(id: 1, name: "", notifications: 0),
];

class CategoriesListPage extends StatelessWidget {
  final String categoryType;

  const CategoriesListPage({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CategoriesPageTemplate(
      pageTitle: getTitle(categoryType),
      categoryType: categoryType,
      buttonItems: getData(categoryType),
      appBarColor: getColor(categoryType),
      boxButtonColor: getColor(categoryType),
    );
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

  // Category list を取得
  List<Category> getData(String categoryType) async {
    debugPrint("=============");
    debugPrint(categoryType);
    switch (categoryType) {
      case "hikidashi":
        final hikidashiCategorys = await getHikidashis();
        return hikidashiCategorys; //DBから取得
      case "shoppingPlace":
        //final shoppingPlaceCategorys = await getShoppingPlace();
        return shoppingPlaceCategorys; //DBから取得
      default:
        return nothig;
    }
  }
}
