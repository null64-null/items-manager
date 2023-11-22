import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atoms/add_button.dart';
import '../../templates/item_edit_page_template.dart';
import '../../pages/item_edit_page.dart';
import '../../../util/classes/items.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/values_dart/initial_values.dart';

class AddItemButton extends ConsumerWidget {
  final String categoryType;
  final int? categoryId;

  const AddItemButton({
    Key? key,
    this.categoryType = "",
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      itemEditInitialize(categoryType, categoryId, ref);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemEditPage(
            categoryType: categoryType,
            initialItem: initialItem(categoryType, categoryId),
          ),
        ),
      );
    }

    return AddButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
    );
  }
}

void itemEditInitialize(String categoryType, int? categoryId, WidgetRef ref) {
  final notifier = ref.read(itemEditProvider.notifier);
  const initialValue = Item(
    name: "",
    remainingValue: 0,
    maxValue: 0,
    unit: "",
  );
  if (categoryType == "hikidashi") {
    final initialItem = initialValue.copyWith(hikidashiId: categoryId);
    notifier.state = initialItem;
  } else if (categoryType == "shoppingPlace") {
    final initialItem = initialValue.copyWith(shoppingPlaceId: categoryId);
    notifier.state = initialItem;
  } else {
    const initialItem = initialValue;
    notifier.state = initialItem;
  }
}

Item initialItem(String categoryType, int? categoryId) {
  if (categoryType == "hikidashi") {
    return itemInit.copyWith(hikidashiId: categoryId);
  }
  if (categoryType == "shoppingPlace") {
    return itemInit.copyWith(shoppingPlaceId: categoryId);
  }
  return itemInit;
}
