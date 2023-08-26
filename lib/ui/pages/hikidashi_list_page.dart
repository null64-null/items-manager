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
  Hikidashi(name: "日用品2", notifications: 1),
  Hikidashi(name: "日用品3", notifications: 0),
  Hikidashi(name: "日用品4", notifications: 0),
  Hikidashi(name: "日用品5", notifications: 1),
  Hikidashi(name: "日用品6", notifications: 1),
  Hikidashi(name: "日用品7", notifications: 0),
];

class HikidashiListPage extends StatelessWidget {
  const HikidashiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("引き出しリスト")),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              for (final hikidashi in hikidashis)
                BoxButton(
                  label: hikidashi.name,
                  color: Colors.blue,
                  notifications: hikidashi.notifications,
                  onPressed: () {
                    debugPrint(hikidashi.name);
                  },
                )
            ],
          )
        ],
      ),
    );
  }
}
