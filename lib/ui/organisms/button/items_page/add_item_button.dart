import 'package:flutter/material.dart';
import '../../../pages/item_edit_page.dart';

class AddItemButton extends StatelessWidget {
  final String categoryType;
  final int? categoryId;

  const AddItemButton({
    Key? key,
    this.categoryType = "",
    this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {
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
