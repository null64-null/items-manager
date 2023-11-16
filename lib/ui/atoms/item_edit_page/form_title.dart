import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;

  const FormTitle({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
