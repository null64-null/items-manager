import 'package:flutter/material.dart';
import './ui/pages/start_page.dart';
import './ui/pages/shopping_place_list_page.dart';
import 'ui/pages/hikidashi_list_page.dart';
import './ui/pages/item_detail_page.dart';

const startPage = StartPage();

void main() {
  int num = 1;
  late dynamic page;
  if (num == 1) {
    page = const StartPage();
  }
  runApp(MaterialApp(home: page));
}
