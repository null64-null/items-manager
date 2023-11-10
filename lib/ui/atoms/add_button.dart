import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onPressed;

  const AddButton({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: icon,
    );
  }
}
