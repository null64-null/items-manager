import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;

  const AddButton({
    Key? key,
    this.onPressed,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: const Icon(Icons.add),
    );
  }
}
