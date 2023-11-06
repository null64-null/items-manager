import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './category_edit_dialog.dart';

class NoButton extends ConsumerWidget {
  const NoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Text("いいえ", style: style),
      onTap: () {
        final notifier = ref.read(isConfirmedProvider.notifier);
        notifier.state = false;
      },
    );
  }
}

final TextStyle style = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);
