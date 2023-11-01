import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './category_edit_dialog.dart';
import '../../../../db/crud.dart';
import '../../../pages/categories_list_page.dart';

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
      onTap: () async {
        await deleteData(categoryId, categoryType);
        await getData(categoryType, ref);
        Future.delayed(Duration.zero, () {
          final notifier = ref.read(registableProvider.notifier);
          notifier.state = false;
          Navigator.pop(context);
        });
      },
    );
  }
}

Future<void> deleteData(int categoryId, String categoryType) async {
  if (categoryType == "hikidashi") {
    await deleteHikidashi(categoryId);
  }
  if (categoryType == "shoppingPlace") {
    await deleteShoppingPlace(categoryId);
  }
}

final style = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);
