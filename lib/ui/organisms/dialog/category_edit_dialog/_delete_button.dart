import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './category_edit_dialog.dart';

class DeleteButton extends ConsumerWidget {
  final int categoryId;

  const DeleteButton({
    Key? key,
    this.categoryId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Text("削除", style: style),
      onTap: () {
        final notifier = ref.read(registableProvider.notifier);
        notifier.state = false;
      },
    );
  }
}

final style = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);
