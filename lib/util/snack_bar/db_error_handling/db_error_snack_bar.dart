import 'package:flutter/material.dart';
import '../snack_bar.dart';

void dbErrorSnackBar({
  required String message,
  required BuildContext context,
}) {
  Widget content = Text(message);

  showSnackBar(
    context: context,
    content: content,
    backgroundColor: Colors.red,
  );
}
