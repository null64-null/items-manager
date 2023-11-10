import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/action_button.dart';

class AddButtonsSection extends StatelessWidget {
  final Color color;
  final VoidCallback? onCancellPressed;
  final VoidCallback? onAddPressed;

  const AddButtonsSection({
    Key? key,
    this.color = Colors.white,
    this.onCancellPressed,
    this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ActionButton(
          label: "キャンセル",
          color: color,
          onPressed: onCancellPressed,
        ),
        const SizedBox(
          width: 20,
        ),
        ActionButton(
          label: "保存",
          color: color,
          onPressed: onAddPressed,
        ),
      ],
    );
  }
}
