import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final bool isActive;

  const ActionButton({
    Key? key,
    this.label = "",
    this.color = Colors.white,
    this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle(color, isActive),
        child: Text(label, style: textStyle),
      ),
    );
  }
}

ButtonStyle buttonStyle(Color color, bool isActive) {
  return ElevatedButton.styleFrom(
    backgroundColor: isActive ? color : Colors.black26, // 例: Colors.blue
  );
}

TextStyle textStyle = const TextStyle(
  fontWeight: FontWeight.bold,
);
