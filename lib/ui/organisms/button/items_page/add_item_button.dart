import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../templates/item_edit_page_template.dart';
import '../../../pages/item_edit_page.dart';

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
    final notifier = ref.read(itemEditProvider.notifier);

    return FloatingActionButton(
      onPressed: () => {
        notifier.state = initialItem,
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemEditPage(categoryType: categoryType),
          ),
        ),
      },
      child: const Icon(Icons.add),
    );
  }
}
