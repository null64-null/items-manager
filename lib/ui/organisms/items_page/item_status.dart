import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../templates/item_edit_page_template.dart';
import '../../../util/classes/items.dart';
import '../../pages/item_edit_page.dart';
import '../../atoms/items_page/gage.dart';

const Item initialItem = Item(
  name: "",
  remainingValue: 0,
  maxValue: 0,
  unit: "",
);

class ItemStatus extends ConsumerWidget {
  final Item item;
  final String categoryType;
  final int categoryId;

  const ItemStatus({
    Key? key,
    this.item = initialItem,
    this.categoryType = "",
    this.categoryId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(itemEditProvider.notifier);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: const Size(331, 75),
        backgroundColor: getBackgroundColor(item.remainingValue, item.maxValue),
        elevation: 5,
      ),
      onPressed: () => {
        notifier.state = item,
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemEditPage(
              categoryId: categoryId,
              categoryType: categoryType,
              initialItem: item,
            ),
          ),
        ),
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
                  item.name,
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
                  getNumberlabel(item.remainingValue),
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
                  getNumberlabel(item.maxValue),
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
                  item.unit,
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
            child: Gage(
                remainingValue: item.remainingValue, maxValue: item.maxValue),
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
