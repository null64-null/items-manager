import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './category_edit_dialog.dart';

class DeleteButton extends ConsumerWidget {
  final int categoryId;
  final String categoryType;

  const DeleteButton({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Text("削除", style: style),
      onTap: () {
        final notifier = ref.read(isConfirmedProvider.notifier);
        notifier.state = true;
      },
    );
  }
}

final style = TextStyle(
  color: Colors.red[600]!,
  fontWeight: FontWeight.w600,
);
