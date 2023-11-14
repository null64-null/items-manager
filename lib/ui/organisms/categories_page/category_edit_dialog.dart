import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_edit_dialog/_cansel_button.dart';
import 'category_edit_dialog/_delete_button.dart';
import 'category_edit_dialog/_update_button.dart';
import 'category_edit_dialog/_yes_button.dart';
import 'category_edit_dialog/_no_button.dart';
import 'category_button.dart';
import '../../pages/categories_page.dart';
import '../../../util/classes/category.dart';

const Category initialCategory =
    Category(id: 0, name: "name", notifications: 0);

final registableProvider = StateProvider<bool>((ref) {
  return false;
});

final isConfirmedProvider = StateProvider<bool>((ref) {
  return false;
});

class CategoryEditDialog extends ConsumerWidget {
  final String categoryType;
  final int categoryId;

  const CategoryEditDialog({
    Key? key,
    this.categoryType = "",
    this.categoryId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConfirmed = ref.watch(isConfirmedProvider);
    final categories = ref.watch(categoriesProvider);
    final formText = ref.watch(formTextProvider);
    final Category category = categories.firstWhere(
      (category) => category.id == categoryId,
      orElse: () => initialCategory,
    );

    return AlertDialog(
      title: Text('${getLabelText(categoryType)}を編集'),
      content: TextFormField(
        initialValue: formText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: getLabelText(categoryType),
        ),
        onChanged: (text) {
          final notifire = ref.read(formTextProvider.notifier);
          notifire.state = text;
          setRegistable(text, ref);
        },
      ),
      actions: actions(isConfirmed, category, categoryType),
    );
  }
}

List<Widget> actions(bool isConfirmed, Category category, String categoryType) {
  if (isConfirmed) {
    return [
      const Text("本当に削除しますか？"),
      const NoButton(),
      YesButton(categoryId: category.id!, categoryType: categoryType),
    ];
  } else {
    return [
      const CanselButton(),
      DeleteButton(categoryId: category.id!, categoryType: categoryType),
      UpdateButton(editCategory: category, categoryType: categoryType),
    ];
  }
}

void setRegistable(String text, WidgetRef ref) {
  final notifier = ref.read(registableProvider.notifier);
  if (text == "") {
    notifier.state = false;
  } else {
    notifier.state = true;
  }
}

String getLabelText(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return "引き出し名";
    case "shoppingPlace":
      return "ショップ名";
    default:
      return "";
  }
}
