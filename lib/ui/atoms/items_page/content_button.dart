import 'package:flutter/material.dart';

ButtonStyle style(Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: backgroundColor,
    elevation: 5,
  );
}

class ContentButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool disabled;

  const ContentButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.child,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331,
      height: 75,
      child: ElevatedButton(
        style: style(backgroundColor),
        onPressed: disabled ? () {} : onPressed,
        child: child,
      ),
    );
  }
}
