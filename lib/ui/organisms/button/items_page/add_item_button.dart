import 'package:flutter/material.dart';

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
      onPressed: () => {},
      child: const Icon(Icons.add),
    );
  }
}
