import 'package:flutter/material.dart';

Text buttonText(String label) {
  return Text(
    label,
    style: buttonTextStyle,
    maxLines: 4,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
  );
}

ButtonStyle buttonStyle(Color color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(color),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

const TextStyle buttonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

class BoxButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Color color;
  final String label;
  final bool disabled;

  const BoxButton({
    Key? key,
    this.onPressed,
    this.onLongPressed,
    this.color = Colors.white,
    this.label = "",
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: ElevatedButton(
        onPressed: disabled ? () {} : onPressed,
        onLongPress: disabled ? () {} : onLongPressed,
        style: buttonStyle(color),
        child: buttonText(label),
      ),
    );
  }
}
