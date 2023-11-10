import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/organisms/button/categories_page/category_button.dart';
import './_cansel_button.dart';
import './_insert_button.dart';

final registableProvider = StateProvider<bool>((ref) {
  return false;
});

class CategoryAddDialog extends ConsumerWidget {
  final String categoryType;
  final int newCategoryId;

  const CategoryAddDialog({
    Key? key,
    this.categoryType = "",
    this.newCategoryId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('${getLabelText(categoryType)}を入力'),
      content: TextFormField(
        decoration: textFormFieldDecoration(categoryType),
        onChanged: (text) {
          final notifire = ref.read(formTextProvider.notifier);
          notifire.state = text;
          setRegistable(text, ref);
        },
      ),
      actions: [
        const CanselButton(),
        InsertButton(categoryType: categoryType),
      ],
    );
  }
}

InputDecoration textFormFieldDecoration(String categoryType) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: getLabelText(categoryType),
  );
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

void setRegistable(String text, WidgetRef ref) {
  final notifier = ref.read(registableProvider.notifier);
  if (text == "") {
    notifier.state = false;
  } else {
    notifier.state = true;
  }
}
