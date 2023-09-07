import 'package:flutter/material.dart';
import './../atoms/box_botton.dart';
import './../pages/start_page.dart';
import './../pages/items_list_page.dart';

class ButtonItem {
  final int id;
  final String name;
  final int notifications;

  const ButtonItem({
    required this.id,
    required this.name,
    required this.notifications,
  });

  void onPressed(context, String buttonType) {
    final dynamic page;

    switch (buttonType) {
      case "hikidashi":
        page = ItemListPage(
          categoryType: "hikidashi",
          categoryId: id,
          categoryName: name,
        );
        break;
      case "shoppingPlace":
        page = ItemListPage(
          categoryType: "shoppingPlace",
          categoryId: id,
          categoryName: name,
        );
        break;
      default:
        page = const StartPage();
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}

const List<ButtonItem> initialButtonItems = [
  ButtonItem(id: 0, name: "name", notifications: 0),
];

class CategoriesPageTemplate extends StatelessWidget {
  final String pageTitle;
  final String categoryType;
  final List<ButtonItem> buttonItems;
  final Color appBarColor;
  final Color boxButtonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.pageTitle = 'title',
    this.categoryType = "",
    this.buttonItems = initialButtonItems,
    this.appBarColor = Colors.white,
    this.boxButtonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              for (final buttonItem in buttonItems)
                BoxButton(
                  label: buttonItem.name,
                  color: boxButtonColor,
                  notifications: buttonItem.notifications,
                  onPressed: () {
                    buttonItem.onPressed(context, categoryType);
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
