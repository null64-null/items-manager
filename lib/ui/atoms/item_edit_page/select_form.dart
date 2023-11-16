import 'package:flutter/material.dart';

class SelectForm extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? options;
  final ValueChanged<dynamic>? onChanged;
  final dynamic value;

  const SelectForm({
    Key? key,
    this.options,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButton(
        items: options,
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
