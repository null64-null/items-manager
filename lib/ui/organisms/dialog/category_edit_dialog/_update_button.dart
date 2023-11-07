import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/organisms/button/category_button.dart';
import './category_edit_dialog.dart';
import '../../../../util/classes/category.dart';
import '../../../pages/categories_page.dart';
import '../../../../db/crud.dart';

const Category initialCategory = Category(id: 0, name: "", notifications: 0);

class UpdateButton extends ConsumerWidget {
  final Category editCategory;
  final String categoryType;

  const UpdateButton({
    Key? key,
    this.editCategory = initialCategory,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registable = ref.watch(registableProvider);
    final formText = ref.watch(formTextProvider);

    return GestureDetector(
      child: Text("更新", style: style(registable)),
      onTap: () async {
        var newCategory = Category(
          id: editCategory.id,
          name: formText,
          notifications: editCategory.notifications,
        );
        await updateData(newCategory, categoryType);
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

Future<void> updateData(Category newCategory, String categoryType) async {
  if (categoryType == "hikidashi") {
    await updateHikidashi(newCategory);
  }
  if (categoryType == "shoppingPlace") {
    await updateShoppingPlace(newCategory);
  }
}

TextStyle style(bool registable) {
  if (registable) {
    return TextStyle(
      color: Colors.blue[800]!,
      fontWeight: FontWeight.w600,
    );
  } else {
    return const TextStyle(
      color: Colors.black26,
      fontWeight: FontWeight.w600,
    );
  }
}
