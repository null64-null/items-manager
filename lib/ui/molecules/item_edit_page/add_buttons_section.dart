import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/action_button.dart';

class AddButtonsSection extends StatelessWidget {
  final Color color;
  final VoidCallback? onCancellPressed;
  final VoidCallback? onAddPressed;
  final bool isActive;

  const AddButtonsSection({
    Key? key,
    this.color = Colors.white,
    this.onCancellPressed,
    this.onAddPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ActionButton(
          label: "キャンセル",
          color: color,
          onPressed: onCancellPressed,
          isActive: true,
        ),
        const SizedBox(
          width: 55,
        ),
        ActionButton(
          label: "保存",
          color: color,
          onPressed: onAddPressed,
          isActive: isActive,
        ),
      ],
    );
  }
}
