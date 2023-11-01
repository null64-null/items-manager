import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../pages/categories_list_page.dart';
import '../../button/category_button.dart';
import './_cansel_button.dart';
import './_delete_button.dart';
import './_update_button.dart';

final registableProvider = StateProvider<bool>((ref) {
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
    final registable = ref.watch(registableProvider);
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
      actions: [
        const CanselButton(),
        DeleteButton(categoryId: categoryId),
        UpdateButton(editCategory: category, categoryType: categoryType),
      ],
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
