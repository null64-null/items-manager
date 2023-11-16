import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atoms/categories_page/dialog_button.dart';
import '../../atoms/categories_page/dialog_text_editor.dart';

final isConfirmedProvider = StateProvider<bool>((ref) {
  return false;
});

class EditDialog extends ConsumerWidget {
  final String title;
  final String formLabel;
  final String? initialValue;
  final Color buttonColor;
  final bool isUpdatable;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapCancell;
  final VoidCallback? onTapDelete;
  final VoidCallback? onTapUpdate;
  final String? Function(String?)? validator;

  const EditDialog({
    Key? key,
    this.title = "",
    this.formLabel = "",
    this.initialValue,
    this.buttonColor = Colors.white,
    this.isUpdatable = true,
    this.onChanged,
    this.onTapCancell,
    this.onTapDelete,
    this.onTapUpdate,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConfirmed = ref.watch(isConfirmedProvider);

    void stopDelete() {
      final notifire = ref.read(isConfirmedProvider.notifier);
      notifire.state = false;
    }

    void goDelete() {
      final notifire = ref.read(isConfirmedProvider.notifier);
      notifire.state = false;
      onTapDelete == null ? () {} : onTapDelete!();
    }

    void tapDelete() {
      final notifire = ref.read(isConfirmedProvider.notifier);
      notifire.state = true;
    }

    return AlertDialog(
      title: Text(title),
      content: DialogTextEditor(
        formLabel: formLabel,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: validator,
      ),
      actions: isConfirmed
          ? [
              const Text("本当に削除しますか？"),
              DialogButton(
                buttonLabel: "いいえ",
                buttonColor: buttonColor,
                onTap: stopDelete,
                isActive: true,
              ),
              DialogButton(
                buttonLabel: "はい",
                buttonColor: Colors.red,
                onTap: goDelete,
                isActive: true,
              ),
            ]
          : [
              DialogButton(
                buttonLabel: "キャンセル",
                buttonColor: buttonColor,
                onTap: onTapCancell,
                isActive: true,
              ),
              DialogButton(
                buttonLabel: "削除",
                buttonColor: Colors.red,
                onTap: tapDelete,
                isActive: true,
              ),
              DialogButton(
                buttonLabel: "更新",
                buttonColor: buttonColor,
                onTap: onTapUpdate,
                isActive: isUpdatable,
              ),
            ],
    );
  }
}
