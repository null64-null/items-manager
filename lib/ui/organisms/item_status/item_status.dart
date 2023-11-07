import 'package:flutter/material.dart';
import '../../atoms/gage.dart';

class ItemStatus extends StatelessWidget {
  final int id;
  final double remainingValue;
  final double maxValue;
  final String unit;
  final String itemName;

  const ItemStatus({
    Key? key,
    this.id = 0,
    this.remainingValue = 1,
    this.maxValue = 1,
    this.unit = "unit",
    this.itemName = "item",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: const Size(331, 75),
        backgroundColor: getBackgroundColor(remainingValue, maxValue),
        elevation: 5,
      ),
      onPressed: () {
        debugPrint(id.toString());
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(-1, 0),
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 75,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  itemName,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.23, -0.8),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  getNumberlabel(remainingValue),
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.48, -0.9),
            child: Container(
              width: 20,
              height: 50,
              alignment: Alignment.center,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  "/",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.73, -0.5),
            child: Container(
              width: 35,
              height: 40,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  getNumberlabel(maxValue),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.98, -0.43),
            child: Container(
              width: 35,
              height: 40,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.95, 0.6),
            child: Gage(remainingValue: remainingValue, maxValue: maxValue),
          ),
        ],
      ),
    );
  }

  Color getBackgroundColor(double remainingValue, double maxValue) {
    final double value = remainingValue / maxValue;
    if (value <= 0.3) {
      return const Color(0xFFFFAEAE);
    } else {
      return const Color(0xFFAEE2FF);
    }
  }

  String getNumberlabel(double value) {
    if (value == value.floor()) {
      return value.toStringAsFixed(0);
    } else {
      return value.toStringAsFixed(1);
    }
  }
}
