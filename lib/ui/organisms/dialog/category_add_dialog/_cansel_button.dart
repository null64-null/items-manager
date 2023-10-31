import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './category_add_dialog.dart';

class CanselButton extends ConsumerWidget {
  const CanselButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Text("キャンセル", style: canselTextStyle),
      onTap: () {
        final notifier = ref.read(registrableProvider.notifier);
        notifier.state = false;
        Navigator.pop(context);
      },
    );
  }
}

final TextStyle canselTextStyle = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);
