import 'package:flutter/material.dart';
import '../atoms/long_button.dart';
import '../pages/hikidashi_list_page.dart';
import '../pages/shopping_place_list_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 250, 253, 255),
      child: Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            const Positioned(
              left: 19,
              top: 170,
              child: SizedBox(
                width: 352,
                height: 111,
                child: Text(
                  'ざいこくん。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
                left: 35,
                top: 381,
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
            Positioned(
                left: 35,
                top: 550,
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
                )),
          ],
        ),
      ),
    );
  }
}
