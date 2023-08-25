import 'package:flutter/material.dart';
import './../atoms/box_botton.dart';

class Hikidashi {
  final String name;
  final int notifications;
  Hikidashi({required this.name, required this.notifications});
}

// dummy data, 後にAPI通信でデータ取得
List<Hikidashi> hikidashis = [
  Hikidashi(name: "冷蔵庫", notifications: 1),
  Hikidashi(name: "クローゼット", notifications: 0),
  Hikidashi(name: "日用品", notifications: 2),
];

class HikidashiListPage extends StatelessWidget {
  const HikidashiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 250, 253, 255),
      child: Container(
        width: 375,
        height: 812,
        padding: const EdgeInsets.only(top: 125),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'ひきだしリスト',
              style: TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                for (final hikidashi in hikidashis)
                  BoxButton(
                    label: hikidashi.name,
                    color: Colors.blue,
                    notifications: hikidashi.notifications,
                    onPressed: () {
                      debugPrint('1');
                    },
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
