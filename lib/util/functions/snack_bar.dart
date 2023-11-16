import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  Widget content,
  String label,
  VoidCallback onPressed,
) {
  final snackBar = SnackBar(
    content: content,
    action: SnackBarAction(label: label, onPressed: onPressed),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
