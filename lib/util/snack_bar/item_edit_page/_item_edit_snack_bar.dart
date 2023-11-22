import 'package:flutter/material.dart';
import '../../classes/items.dart';
import '../snack_bar.dart';

void itemEditSnackBar({
  required Item newItem,
  required BuildContext context,
  required Color backgroundColor,
}) {
  final content = messages(itemName: newItem.name);

  showSnackBar(
    context: context,
    content: content,
    backgroundColor: backgroundColor,
  );
}

Widget messages({required String itemName}) {
  return Text(
    '「${(itemName)}」への変更を保存しました',
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
  );
}
