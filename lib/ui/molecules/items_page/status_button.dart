import 'package:flutter/material.dart';
import '../../atoms/items_page/gage.dart';
import '../../atoms/items_page/content_button.dart';
import '../../atoms/items_page/sized_text.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final double remainingValue;
  final double maxValue;
  final String unit;

  const StatusButton({
    Key? key,
    this.title = "",
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.remainingValue = 0,
    this.maxValue = 0,
    this.unit = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentButton(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(-1, 0),
            child: SizedText(
              text: title,
              textSize: 30,
              width: 140,
              height: 75,
            ),
          ),
          Align(
            alignment: const Alignment(0.23, -0.8),
            child: SizedText(
              text: getNumberlabel(remainingValue),
              textSize: 35,
              width: 50,
              height: 50,
            ),
          ),
          const Align(
            alignment: Alignment(0.48, -0.9),
            child: SizedText(
              text: "/",
              textSize: 30,
              width: 20,
              height: 50,
            ),
          ),
          Align(
            alignment: const Alignment(0.73, -0.5),
            child: SizedText(
              text: getNumberlabel(maxValue),
              textSize: 30,
              width: 35,
              height: 40,
            ),
          ),
          Align(
            alignment: const Alignment(0.98, -0.43),
            child: SizedText(
              text: unit,
              textSize: 30,
              width: 35,
              height: 40,
            ),
          ),
          Align(
            alignment: const Alignment(0.95, 0.6),
            child: Gage(
              remainingValue: remainingValue,
              maxValue: maxValue,
            ),
          ),
        ],
      ),
    );
  }
}

String getNumberlabel(double value) {
  if (value == value.floor()) {
    return value.toStringAsFixed(0);
  } else {
    return value.toStringAsFixed(1);
  }
}
