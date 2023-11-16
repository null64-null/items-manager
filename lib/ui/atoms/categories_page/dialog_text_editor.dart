import 'package:flutter/material.dart';
import '../../../util/developper_setting/values.dart';

final _formKey = GlobalKey<FormState>();

class DialogTextEditor extends StatelessWidget {
  final String formLabel;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const DialogTextEditor({
    Key? key,
    this.formLabel = "",
    this.initialValue,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  String? validatorSample(String? value) {
    if (value == "" || value == null) {
      return "入力してください";
    }
    if (value.length > textLengthLimit) {
      return '${(textLengthLimit)}文字以下で入力してください';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        initialValue: initialValue,
        decoration: textFormFieldDecoration(formLabel),
        onChanged: (text) {
          onChanged!(text);
          _formKey.currentState!.validate();
        },
        validator: validatorSample,
      ),
    );
  }
}

InputDecoration textFormFieldDecoration(String label) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
  );
}
