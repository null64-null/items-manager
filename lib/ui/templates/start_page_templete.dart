import 'package:flutter/material.dart';
import '../atoms/long_button.dart';
import '../pages/hikidashi_list_page.dart';
import '../pages/shopping_place_list_page.dart';

class StartPageTemplate extends StatelessWidget {
  const StartPageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Align(
              alignment: Alignment(0, -0.6),
              child: Text(
                "ざいこくん",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                ),
              )),
          Align(
              alignment: const Alignment(0, 0),
              child: LongButton(
                label: 'おうちのひきだし',
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HikidashiListPage()),
                  );
                },
              )),
          Align(
            alignment: const Alignment(0, 0.5),
            child: LongButton(
              label: 'かいものリスト',
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShoppingPlaceListPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
