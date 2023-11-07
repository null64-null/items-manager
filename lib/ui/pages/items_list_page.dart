import 'package:flutter/material.dart';
import './../templates/items_list_page_template.dart';
import '../../util/dummy_data/dummy_data.dart';
import '../../util/classes/items.dart';

class ItemsListPage extends StatelessWidget {
  final String categoryType;
  final int categoryId;
  final String categoryName;

  const ItemsListPage({
    Key? key,
    this.categoryType = "",
    this.categoryId = 0,
    this.categoryName = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemsListPageTemplate(
      pageTitle: categoryName,
      appBarColor: const Color.fromARGB(255, 255, 124, 59), // change later
      items: getData(),
    );
  }

  // 該当のpageType, categoryIdに該当する買い物アイテムデータを取得
  List<Item> getData() {
    debugPrint("------------");
    debugPrint(categoryType);
    debugPrint(categoryId.toString());
    return items; //statusItemsをDBから取得
  }
}
