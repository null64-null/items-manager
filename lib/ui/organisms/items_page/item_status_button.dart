import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/items_page/status_button.dart';
import '../../templates/item_edit_page_template.dart';
import '../../pages/item_edit_page.dart';
import '../../../util/classes/items.dart';
import '../../../util/values_dart/initial_values.dart';

class ItemStatusButton extends ConsumerWidget {
  final Item item;
  final String categoryType;
  final int? categoryId;

  const ItemStatusButton({
    Key? key,
    this.item = itemInit,
    this.categoryType = "",
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifier = ref.read(itemEditProvider.notifier);
      notifier.state = item;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemEditPage(
            categoryId: categoryId,
            categoryType: categoryType,
            initialItem: item,
          ),
        ),
      );
    }

    return StatusButton(
      title: item.name,
      backgroundColor: getBackgroundColor(item.remainingValue, item.maxValue),
      maxValue: item.maxValue,
      remainingValue: item.remainingValue,
      unit: item.unit,
      onPressed: onPressed,
    );
  }
}

Color getBackgroundColor(double remainingValue, double maxValue) {
  final double value = remainingValue / maxValue;
  if (value <= 0.3) {
    return const Color(0xFFFFAEAE);
  } else {
    return const Color(0xFFAEE2FF);
  }
}
