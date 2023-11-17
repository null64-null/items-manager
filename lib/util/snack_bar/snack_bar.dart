import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required Widget content,
  required Color backgroundColor,
  SnackBarAction? snackBarAction,
}) {
  final snackBar = SnackBar(
    content: content,
    action: snackBarAction,
    backgroundColor: backgroundColor,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
