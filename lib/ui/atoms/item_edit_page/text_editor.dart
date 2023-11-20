import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../util/developper_setting/values.dart';

class TextEditor extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final bool isNumeric;
  final String? Function(String?)? validator;
  final String? placeholder;
  final double? width;

  const TextEditor({
    Key? key,
    this.initialValue = "",
    this.onChanged,
    this.isNumeric = false,
    this.validator,
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
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}

// sample validation (not used)
String? validatorString(String? value) {
  if (value == "" || value == null) {
    return "入力してください";
  }
  if (value.length > textLengthLimit) {
    return '${(textLengthLimit)}文字以下で入力してください';
  }
  return null;
}

// sample validation (not used)
String? validatorNumeric(String? value) {
  if (value != null) {
    final number = double.parse(value);
    if (number < 0) {
      return '0以上の値を入力してください';
    }
    if (number > 100) {
      return '100未満の値を入力してください';
    }
  }
  return null;
}
