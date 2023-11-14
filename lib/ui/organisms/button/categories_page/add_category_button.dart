import 'package:flutter/material.dart';
import '../../dialog/category_add_dialog/category_add_dialog.dart';
import '../../../atoms/add_button.dart';

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
    return AddButton(
      color: getColor(categoryType),
      onPressed: () => {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CategoryAddDialog(
              categoryType: categoryType,
              newCategoryId: itemsLength + 1,
            );
          },
        ),
      },
    );
  }
}

Color getColor(String categoryType) {
  if (categoryType == "hikidashi") {
    return Colors.blue;
  } else if (categoryType == "shoppingPlace") {
    return Colors.green;
  } else {
    return Colors.white;
  }
}
