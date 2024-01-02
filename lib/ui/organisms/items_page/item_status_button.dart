import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/items_page/status_button.dart';
import '../../templates/item_edit_page_template.dart';
import '../../pages/item_edit_page.dart';
import '../../../util/classes/items.dart';
import '../../../util/values/initial_values.dart';

Color getBackgroundColor(double remainingValue, double maxValue) {
  final double value = remainingValue / maxValue;
  if (value <= 0.3) {
    return const Color(0xFFFFAEAE);
  } else {
    return const Color(0xFFAEE2FF);
  }
}

class ItemStatusButton extends ConsumerWidget {
  final Item item;
  final String categoryType;
  final int? categoryId;
  final bool disabled;

  const ItemStatusButton({
    Key? key,
    this.item = itemInit,
    this.categoryType = "",
    this.categoryId,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifierItemEdit = ref.read(itemEditProvider.notifier);
      notifierItemEdit.state = item;
      final notifireIsActive = ref.read(isActiveProvider.notifier);
      notifireIsActive.state = true;
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
      disabled: disabled,
    );
  }
}
