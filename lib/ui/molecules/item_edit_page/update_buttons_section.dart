import 'package:flutter/material.dart';
import '../../atoms/item_edit_page/action_button.dart';

class UpdateButtonsSection extends StatelessWidget {
  final Color color;
  final VoidCallback? onCancellPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onUpdatePressed;
  final bool isActive;

  const UpdateButtonsSection({
    Key? key,
    this.color = Colors.white,
    this.onCancellPressed,
    this.onDeletePressed,
    this.onUpdatePressed,
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
          width: 20,
        ),
        ActionButton(
          label: "削除",
          color: Colors.red,
          onPressed: onDeletePressed,
          isActive: true,
        ),
        const SizedBox(
          width: 20,
        ),
        ActionButton(
          label: "保存",
          color: color,
          onPressed: onUpdatePressed,
          isActive: isActive,
        ),
      ],
    );
  }
}
