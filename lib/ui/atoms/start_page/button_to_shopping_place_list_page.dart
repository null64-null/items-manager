import 'package:flutter/material.dart';
import './../long_button.dart';
import './../../pages/shopping_place_list_page.dart';

class ButtonToShoppingPlaceListPage extends StatelessWidget {
  const ButtonToShoppingPlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LongButton(
      label: 'かいものリスト',
      color: const Color.fromARGB(255, 72, 255, 127),
      onPressed: () {
        debugPrint('かいものリスト');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShoppingPlaceListPage()),
        );
      },
    );
  }
}
