import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String buttonLabel;
  final Color buttonColor;
  final VoidCallback? onTap;
  final bool isActive;

  const DialogButton({
    Key? key,
    this.buttonColor = Colors.black,
    this.buttonLabel = "",
    this.onTap,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(buttonLabel, style: style(buttonColor, isActive)),
    );
  }
}

TextStyle style(Color buttonColor, bool registable) {
  return TextStyle(
    color: registable ? buttonColor : Colors.black26,
    fontWeight: FontWeight.w600,
  );
}
