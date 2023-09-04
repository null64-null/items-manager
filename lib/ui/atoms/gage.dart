import 'package:flutter/material.dart';

class Gage extends StatelessWidget {
  final double remainingValue;
  final double maxValue;

  const Gage({
    Key? key,
    this.remainingValue = 1,
    this.maxValue = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 12,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black54,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            color: getGageColor(remainingValue, maxValue),
            value: remainingValue / maxValue,
          ),
        ),
      ),
    );
  }

  getGageColor(remainingValue, maxValue) {
    final double value = remainingValue / maxValue;
    if (value <= 0.3) {
      return Colors.red[700]!;
    } else {
      return Colors.blue[900]!;
    }
  }
}
