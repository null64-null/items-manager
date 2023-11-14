import 'package:flutter/material.dart';
import '../../atoms/categories_page/dialog_button.dart';
import '../../atoms/categories_page/dialog_text_editor.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class AddDialog extends StatelessWidget {
  final String title;
  final String formLabel;
  final Color buttonColor;
  final bool isAddable;
  final Function onChanged;
  final VoidCallback? onTapCancell;
  final VoidCallback? onTapAdd;

  const AddDialog({
    Key? key,
    this.title = "",
    this.formLabel = "",
    this.buttonColor = Colors.white,
    this.isAddable = true,
    this.onChanged = defaultOnChanged,
    this.onTapCancell,
    this.onTapAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: DialogTextEditor(
        formLabel: formLabel,
        onChanged: onChanged,
      ),
      actions: [
        DialogButton(
          buttonLabel: "キャンセル",
          buttonColor: buttonColor,
          onTap: onTapCancell,
          isActive: true,
        ),
        DialogButton(
          buttonLabel: "保存",
          buttonColor: buttonColor,
          onTap: onTapAdd,
          isActive: isAddable,
        ),
      ],
    );
  }
}
