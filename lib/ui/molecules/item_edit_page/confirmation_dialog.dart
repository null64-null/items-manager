import 'package:flutter/material.dart';
import '../../atoms/items_page/dialog_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final VoidCallback? onTapYes;
  final VoidCallback? onTapNo;

  const ConfirmationDialog({
    Key? key,
    this.title = "",
    this.buttonColor = Colors.white,
    this.onTapYes,
    this.onTapNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        DialogButton(
          buttonLabel: "いいえ",
          buttonColor: buttonColor,
          onTap: onTapNo,
          isActive: true,
        ),
        DialogButton(
          buttonLabel: "はい",
          buttonColor: Colors.red,
          onTap: onTapYes,
          isActive: true,
        ),
      ],
    );
  }
}
