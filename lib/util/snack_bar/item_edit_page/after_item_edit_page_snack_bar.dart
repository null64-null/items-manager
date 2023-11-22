import 'package:flutter/material.dart';
import './_item_add_snack_bar.dart';
import './_item_add_snack_bar_moved.dart';
import './_item_edit_snack_bar.dart';
import './_item_edit_snack_bar_moved.dart';
import './_item_delete_snack_bar.dart';
import '../../classes/items.dart';
import '../../classes/category.dart';

void afterItemAddSnackBar({
  required Item newItem,
  required String categoryType,
  required List<Category> categories,
  required Item initialItem,
  required BuildContext context,
  required Color backgroundColor,
}) {
  var isMoved = false;

  debugPrint(initialItem.hikidashiId.toString());
  debugPrint(newItem.hikidashiId.toString());

  if (categoryType == "hikidashi") {
    if (initialItem.hikidashiId != newItem.hikidashiId) {
      isMoved = true;
    }
  }
  if (categoryType == "shoppingPlace") {
    if (initialItem.shoppingPlaceId != newItem.shoppingPlaceId) {
      isMoved = true;
    }
  }

  debugPrint(isMoved.toString());

  if (isMoved) {
    itemAddSnackBarMoved(
      newItem: newItem,
      categoryType: categoryType,
      categories: categories,
      context: context,
      backgroundColor: backgroundColor,
    );
  } else {
    itemAddSnackBar(
      newItem: newItem,
      context: context,
      backgroundColor: backgroundColor,
    );
  }
}

void afterItemEditSnackBar({
  required Item newItem,
  required String categoryType,
  required List<Category> categories,
  required Item initialItem,
  required BuildContext context,
  required Color backgroundColor,
}) {
  var isMoved = false;

  if (categoryType == "hikidashi") {
    if (initialItem.hikidashiId != newItem.hikidashiId) {
      isMoved = true;
    }
  }
  if (categoryType == "shoppingPlace") {
    if (initialItem.shoppingPlaceId != newItem.shoppingPlaceId) {
      isMoved = true;
    }
  }

  if (isMoved) {
    itemEditSnackBarMoved(
      newItem: newItem,
      categoryType: categoryType,
      categories: categories,
      context: context,
      backgroundColor: backgroundColor,
    );
  } else {
    itemEditSnackBar(
      newItem: newItem,
      context: context,
      backgroundColor: backgroundColor,
    );
  }
}

void afterItemDeleteSnackBar({
  required Item newItem,
  required BuildContext context,
  required Color backgroundColor,
}) {
  itemDeleteSnackBar(
    newItem: newItem,
    context: context,
    backgroundColor: backgroundColor,
  );
}
