import 'package:flutter/material.dart';
import './ui/pages/start_page.dart';
import './ui/pages/shopping_place_list_page.dart';
import 'ui/pages/hikidashi_list_page.dart';
import './ui/templates/start_page_templete.dart';
import './ui/atoms/gage.dart';
import './ui/organisms/item_status.dart';
import './ui/templates/items_list_page_template.dart';
import './ui/pages/items_list_page_from_hikidashi_list.dart';

void main() {
  int num = 6;
  late dynamic page;
  if (num == 1) {
    page = const StartPage();
  } else if (num == 2) {
    page = const HikidashiListPage();
  } else if (num == 3) {
    page = const ShoppingPlaceListPage();
  } else if (num == 4) {
    page = const StartPageTemplate();
  } else if (num == 5) {
    page = const ItemListPageFromHikidashiList();
  } else if (num == 6) {
    page = Container(
      color: Colors.white,
      child: const Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: ItemStatus(
              remainingValue: 5,
              maxValue: 10,
              unit: "個",
              itemName: "にんじん",
            ),
          )
        ],
      ),
    );
  }
  runApp(MaterialApp(home: page));
}
