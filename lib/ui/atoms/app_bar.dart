import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: color,
    );
  }
}
