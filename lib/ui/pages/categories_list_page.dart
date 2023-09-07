import 'package:flutter/material.dart';
import 'package:test_app/ui/templates/categories_page_template.dart';

// dummy data, 後にAPI通信でデータ取得
List<ButtonItem> hikidashiButtonItems = [
  const ButtonItem(id: 1, name: "冷蔵庫", notifications: 1),
  const ButtonItem(id: 2, name: "冷凍庫", notifications: 0),
  const ButtonItem(id: 3, name: "野菜室", notifications: 0),
  const ButtonItem(id: 4, name: "調味料棚", notifications: 2),
  const ButtonItem(id: 5, name: "日用品", notifications: 2),
  const ButtonItem(id: 6, name: "その他", notifications: 1),
];
List<ButtonItem> shoppingPlaceButtonItems = [
  const ButtonItem(id: 1, name: "業スー", notifications: 1),
  const ButtonItem(id: 2, name: "ベルクス", notifications: 0),
  const ButtonItem(id: 3, name: "オーケー", notifications: 2),
  const ButtonItem(id: 4, name: "セイムズ", notifications: 2),
  const ButtonItem(id: 5, name: "楽天市場", notifications: 0),
];
List<ButtonItem> nothig = [
  const ButtonItem(id: 1, name: "", notifications: 0),
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
      pageType: "hikidashi",
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

  // API : Category list を取得
  List<ButtonItem> getData(String categoryType) {
    debugPrint(categoryType);
    switch (categoryType) {
      case "hikidashi":
        return hikidashiButtonItems;
      case "shoppingPlace":
        return shoppingPlaceButtonItems;
      default:
        return nothig;
    }
  }
}
