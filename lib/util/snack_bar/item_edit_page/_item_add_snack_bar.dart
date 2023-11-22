import 'package:flutter/material.dart';
import '../../classes/category.dart';
import '../../classes/items.dart';
import '../snack_bar.dart';

void itemAddSnackBarMoved({
  required Item newItem,
  required String categoryType,
  required List<Category> categories,
  required BuildContext context,
  required Color backgroundColor,
}) {
  if (categoryType == "hikidashi") {
    Category categoryOfNewItem = categories.firstWhere(
      (e) => e.id == newItem.hikidashiId,
      orElse: () => const Category(name: ""),
    );

    final content = messages(
      itemName: newItem.name,
      categoryName: categoryOfNewItem.name,
      categoryTypeName: "引き出し",
    );

    showSnackBar(
      context: context,
      content: content,
      backgroundColor: backgroundColor,
    );
  }
  if (categoryType == "shoppingPlace") {
    Category categoryOfNewItem = categories.firstWhere(
      (e) => e.id == newItem.shoppingPlaceId,
      orElse: () => const Category(name: ""),
    );

    final content = messages(
      itemName: newItem.name,
      categoryName: categoryOfNewItem.name,
      categoryTypeName: "お店",
    );

    showSnackBar(
      context: context,
      content: content,
      backgroundColor: backgroundColor,
    );
  }
}

Widget messages({
  required String itemName,
  required String categoryName,
  required String categoryTypeName,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      designedText(label: '「${(itemName)}」を保存しました'),
      designedText(label: '${(categoryTypeName)}「${(categoryName)}」へ移動しました'),
    ],
  );
}

Widget designedText({required String label}) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
  );
}
