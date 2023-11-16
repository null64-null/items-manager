import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/form_title.dart';
import '../../atoms/item_edit_page/select_form.dart';

class LabeledSelectForm extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<dynamic>>? options;
  final ValueChanged<dynamic>? onChanged;
  final dynamic value;

  const LabeledSelectForm({
    Key? key,
    this.title = "",
    this.options,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 25),
        SizedBox(
          width: 120,
          child: FormTitle(title: title),
        ),
        const SizedBox(width: 20),
        SelectForm(
          options: options,
          onChanged: onChanged,
          value: value,
        ),
      ],
    );
  }
}
