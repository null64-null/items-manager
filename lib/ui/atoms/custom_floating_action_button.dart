import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Icon icon;

  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
    this.color = Colors.white,
    this.icon = const Icon(Icons.add),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: icon,
    );
  }
}
