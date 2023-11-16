import 'package:flutter/material.dart';
import '../../atoms/add_button.dart';
import 'category_add_dialog.dart';
import '../../../../util/functions/get_color.dart';

class AddCategoryButton extends StatelessWidget {
  final String categoryType;
  final int itemsLength;

  const AddCategoryButton({
    Key? key,
    this.categoryType = "",
    this.itemsLength = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CategoryAddDialog(
            categoryType: categoryType,
            newCategoryId: itemsLength + 1,
          );
        },
      );
    }

    return AddButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
    );
  }
}
