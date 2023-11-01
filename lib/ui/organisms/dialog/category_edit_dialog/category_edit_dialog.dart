import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../pages/categories_list_page.dart';
import '../../button/category_button.dart';
import '../../../../util/classes/category.dart';
import './_cansel_button.dart';
import './_delete_button.dart';
import './_update_button.dart';
import './_yes_button.dart';
import './_no_button.dart';

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
    final category = categories[categoryId - 1];

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
      actions: actions(isConfirmed, category, categoryId, categoryType),
    );
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

List<Widget> actions(
    bool isConfirmed, Category category, int categoryId, String categoryType) {
  if (isConfirmed) {
    return [
      const NoButton(),
      YesButton(categoryId: categoryId, categoryType: categoryType),
    ];
  } else {
    return [
      const CanselButton(),
      DeleteButton(categoryId: categoryId, categoryType: categoryType),
      UpdateButton(editCategory: category, categoryType: categoryType),
    ];
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
