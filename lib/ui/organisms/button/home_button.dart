import 'package:flutter/material.dart';
import '../../pages/start_page.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StartPage(),
          ),
        ),
      },
      child: const Icon(Icons.home),
    );
  }
}
