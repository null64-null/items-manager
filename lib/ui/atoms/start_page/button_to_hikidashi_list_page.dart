import 'package:flutter/material.dart';
import './../long_button.dart';
import './../../pages/hikidashi_list_page.dart';

class ButtonToHikidashiListPage extends StatelessWidget {
  const ButtonToHikidashiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LongButton(
      label: 'おうちのひきだし',
      color: Colors.blue,
      onPressed: () {
        debugPrint('おうちのひきだし');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HikidashiListPage()),
        );
      },
    );
  }
}
