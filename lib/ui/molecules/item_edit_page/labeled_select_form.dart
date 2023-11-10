import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/form_title.dart';
import '../../atoms/item_edit_page/select_form.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class LabeledSelectForm extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<dynamic>>? options;
  final Function onChange;
  final dynamic value;

  const LabeledSelectForm({
    Key? key,
    this.title = "",
    this.options,
    this.onChange = defaultOnChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FormTitle(title: title),
        const SizedBox(width: 20),
        SelectForm(
          options: options,
          onChange: onChange,
          value: value,
        ),
      ],
    );
  }
}
