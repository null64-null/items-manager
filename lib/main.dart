import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './ui/pages/start_page.dart';
import './ui/pages/shopping_place_list_page.dart';
import 'ui/pages/hikidashi_list_page.dart';
import './ui/pages/item_detail_page.dart';

void main() {
  int num = 2;
  late dynamic page;
  if (num == 1) {
    page = const StartPage();
  } else if (num == 2) {
    page = const HikidashiListPage();
  }
  runApp(MaterialApp(home: page));
}
