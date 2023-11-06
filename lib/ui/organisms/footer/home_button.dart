import 'package:flutter/material.dart';
import '../../pages/start_page.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StartPage(),
          ),
        ),
      },
      icon: const Icon(Icons.home),
    );
  }
}
