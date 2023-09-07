import 'package:flutter/material.dart';
import './../atoms/box_botton.dart';
import './../pages/start_page.dart';
import './../pages/items_list_page_from_hikidashi_list.dart';
import './../pages/items_list_page_from_shopping_place_list.dart';

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
        page = ItemListPageFromHikidashiList(
          hikidashiId: id,
          hikidashiName: name,
        );
        break;
      case "shoppingPlace":
        page = ItemListPageFromShoppingPlaceList(
          shoppingPlaceId: id,
          shoppingPlaceName: name,
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

class BoxButtonsPageTemplate extends StatelessWidget {
  final String pageTitle;
  final String pageType;
  final List<ButtonItem> buttonItems;
  final Color appBarColor;
  final Color boxButtonColor;

  const BoxButtonsPageTemplate({
    Key? key,
    this.pageTitle = 'title',
    this.pageType = "",
    this.buttonItems = initialButtonItems,
    this.appBarColor = Colors.white,
    this.boxButtonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
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
                    buttonItem.onPressed(context, pageType);
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
