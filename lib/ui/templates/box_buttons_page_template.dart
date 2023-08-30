import 'package:flutter/material.dart';
import './../atoms/box_botton.dart';

class ButtonItem {
  final String name;
  final int notifications;

  const ButtonItem({
    required this.name,
    required this.notifications,
  });

  //ここをページ遷移関数に変更
  void onPressed() {
    debugPrint(name);
  }
}

const List<ButtonItem> initialButtonItems = [
  ButtonItem(name: "name", notifications: 0),
];

class BoxButtonsPageTemplate extends StatelessWidget {
  final String pageTitle;
  final List<ButtonItem> buttonItems;
  final Color appBarColor;
  final Color boxButtonColor;

  const BoxButtonsPageTemplate({
    Key? key,
    this.pageTitle = 'title',
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
                  onPressed: buttonItem.onPressed,
                )
            ],
          )
        ],
      ),
    );
  }
}
