import 'package:flutter/material.dart';

class DialogTextEditor extends StatelessWidget {
  final String formLabel;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const DialogTextEditor({
    Key? key,
    this.formLabel = "",
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: textFormFieldDecoration(formLabel),
      onChanged: onChanged,
    );
  }
}

InputDecoration textFormFieldDecoration(String label) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
  );
}
