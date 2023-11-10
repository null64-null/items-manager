import 'package:flutter/material.dart';

void defaultOnChanged(String text) {
  debugPrint(text);
}

class SelectForm extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? options;
  final Function onChange;
  final dynamic value;

  const SelectForm({
    Key? key,
    this.options,
    this.onChange = defaultOnChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButton(
        items: options,
        onChanged: (value) {
          onChange(value);
        },
        value: value,
      ),
    );
  }
}
