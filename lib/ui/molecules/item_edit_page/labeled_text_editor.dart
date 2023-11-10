import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/form_title.dart';
import '../../atoms/item_edit_page/text_editor.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class LabeledTextEditor extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function onChanged;
  final bool isNumeric;
  final String? placeholder;
  final double? width;

  const LabeledTextEditor({
    Key? key,
    this.title = "",
    this.initialValue = "",
    this.onChanged = defaultOnChanged,
    this.isNumeric = false,
    this.placeholder,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FormTitle(title: title),
        const SizedBox(width: 20),
        TextEditor(
          initialValue: initialValue,
          onChanged: onChanged,
          isNumeric: isNumeric,
          placeholder: placeholder,
          width: width,
        ),
      ],
    );
  }
}
