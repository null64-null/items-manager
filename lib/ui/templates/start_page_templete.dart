import 'package:flutter/material.dart';
import '../atoms/start_page/long_button.dart';
import '../pages/categories_page.dart';

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
            ),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: LongButton(
              label: 'おうちのひきだし',
              color: const Color(0xFF54D6FF),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoriesPage(categoryType: "hikidashi"),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: LongButton(
              label: 'かいものリスト',
              color: const Color(0xFF62FF54),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoriesPage(categoryType: "shoppingPlace"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
