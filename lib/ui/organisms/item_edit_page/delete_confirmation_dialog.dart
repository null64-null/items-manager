import 'package:flutter/material.dart';
import '../../molecules/item_edit_page/confirmation_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String itemName;
  final Color buttonColor;
  final VoidCallback? onTapCancell;
  final VoidCallback? onTapDelete;

  const DeleteConfirmationDialog({
    Key? key,
    this.itemName = "",
    this.buttonColor = Colors.white,
    this.onTapCancell,
    this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: "アイテム${(itemName)}を削除してもよろしいですか？",
      buttonColor: buttonColor,
      onTapNo: onTapCancell,
      onTapYes: onTapDelete,
    );
  }
}
