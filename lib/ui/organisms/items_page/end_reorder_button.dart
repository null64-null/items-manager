import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/templates/items_page_template.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../pages/items_page.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/classes/items.dart';
import '../../../db/basic_crud.dart';

class EndReorderButton extends ConsumerWidget {
  final String categoryType;

  const EndReorderButton({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.read(itemsProvider);

    void onPressed() async {
      List<int> itemIds = items.map((item) => item.id!).toList();
      await deleteItems(itemIds);

      List<Item> newItems = [];
      for (int i = 0; i < items.length; i++) {
        if (categoryType == "hikidashi") {
          newItems.add(items[i].copyWith(id: null, hikidashiNum: i));
        }
        if (categoryType == "shoppingPlace") {
          newItems.add(items[i].copyWith(id: null, shoppingPlaceNum: i));
        }
      }
      await insertItems(newItems);

      final notifire = ref.read(isBeingReorderdProvider.notifier);
      notifire.state = false;
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.check),
    );
  }
}
