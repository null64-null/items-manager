import 'package:flutter/material.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class DialogTextEditor extends StatelessWidget {
  final String formLabel;
  final String? initialValue;
  final Function onChanged;

  const DialogTextEditor({
    Key? key,
    this.formLabel = "",
    this.initialValue,
    this.onChanged = defaultOnChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: textFormFieldDecoration(formLabel),
      onChanged: (text) {
        onChanged(text);
      },
    );
  }
}

InputDecoration textFormFieldDecoration(String label) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
  );
}
