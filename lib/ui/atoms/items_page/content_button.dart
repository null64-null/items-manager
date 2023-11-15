import 'package:flutter/material.dart';

class ContentButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final Widget? child;

  const ContentButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style(backgroundColor),
      onPressed: onPressed,
      child: child,
    );
  }
}

ButtonStyle style(Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    fixedSize: const Size(331, 75),
    backgroundColor: backgroundColor,
    elevation: 5,
  );
}
