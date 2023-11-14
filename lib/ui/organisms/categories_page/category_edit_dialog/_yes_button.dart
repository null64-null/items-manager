import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../category_edit_dialog.dart';
import '../../../pages/categories_page.dart';
import '../../../../db/crud.dart';

class YesButton extends ConsumerWidget {
  final int categoryId;
  final String categoryType;

  const YesButton({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Text("はい", style: style),
      onTap: () async {
        await deleteData(categoryId, categoryType);
        await getData(categoryType, ref);
        Future.delayed(Duration.zero, () {
          final registableNotifier = ref.read(registableProvider.notifier);
          registableNotifier.state = false;
          final isConfirmedNotifier = ref.read(isConfirmedProvider.notifier);
          isConfirmedNotifier.state = false;
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
  color: Colors.red[600]!,
  fontWeight: FontWeight.w600,
);
