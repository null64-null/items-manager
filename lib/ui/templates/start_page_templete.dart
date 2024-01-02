import 'package:flutter/material.dart';
import '../atoms/start_page/long_button.dart';
import '../pages/categories_page.dart';

void transferToCategoryPage(BuildContext context, String categoryType) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoriesPage(categoryType: categoryType),
    ),
  );
}

TextStyle titleTextStyle = const TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w400,
);

class StartPageTemplate extends StatelessWidget {
  const StartPageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(0, -0.6),
            child: Text("ざいこくん", style: titleTextStyle),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: LongButton(
              label: 'ストックするもの',
              color: const Color(0xFF54D6FF),
              onPressed: () {
                transferToCategoryPage(context, "hikidashi");
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: LongButton(
              label: 'かいものリスト',
              color: const Color(0xFF62FF54),
              onPressed: () {
                transferToCategoryPage(context, "shoppingPlace");
              },
            ),
          ),
        ],
      ),
    );
  }
}
