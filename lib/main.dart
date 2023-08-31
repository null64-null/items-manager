import 'package:flutter/material.dart';
import './ui/pages/start_page.dart';
import './ui/pages/shopping_place_list_page.dart';
import 'ui/pages/hikidashi_list_page.dart';

void main() {
  int num = 1;
  late dynamic page;
  if (num == 1) {
    page = const StartPage();
  } else if (num == 2) {
    page = const HikidashiListPage();
  } else if (num == 3) {
    page = const ShoppingPlaceListPage();
  }
  runApp(MaterialApp(home: page));
}
