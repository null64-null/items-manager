import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class TextEditor extends StatelessWidget {
  final String initialValue;
  final Function onChanged;
  final bool isNumeric;
  final String? placeholder;
  final double? width;

  const TextEditor({
    Key? key,
    this.initialValue = "",
    this.onChanged = defaultOnChanged,
    this.isNumeric = false,
    this.placeholder,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        inputFormatters:
            isNumeric ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: placeholder,
        ),
        onChanged: (text) {
          onChanged(text);
        },
      ),
    );
  }
}