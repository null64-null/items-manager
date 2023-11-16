import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final double textSize;
  final double width;
  final double height;

  const SizedText({
    Key? key,
    this.text = "",
    this.textSize = 0,
    this.width = 0,
    this.height = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(text, style: style(textSize)),
      ),
    );
  }
}

TextStyle style(double textSize) {
  return TextStyle(
    fontSize: textSize,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}
