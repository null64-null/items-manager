import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/util/classes/category.dart';
import '../../../pages/categories_list_page.dart';
import '../../button/category_button.dart';
import '../../../../db/crud.dart';

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
        GestureDetector(
          child: Text("キャンセル", style: buttonFontStyle),
          onTap: () {
            setRegistableDisable(ref);
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text("削除", style: buttonFontStyle),
          onTap: () async {
            setRegistableDisable(ref);
          },
        ),
        GestureDetector(
          child: Text("更新",
              style: registable ? buttonFontStyle : buttonFontStyleDisabled),
          onTap: () async {
            var newCategory = Category(
              id: category.id,
              name: formText,
              notifications: category.notifications,
            );
            await updateData(newCategory, categoryType);
            await getData(categoryType, ref);
            Future.delayed(Duration.zero, () {
              setRegistableDisable(ref);
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}

final buttonFontStyle = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);

const buttonFontStyleDisabled = TextStyle(
  color: Colors.black26,
  fontWeight: FontWeight.w600,
);

void disactivateRegist(WidgetRef ref) {
  final notifier = ref.read(registableProvider.notifier);
  notifier.state = false;
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

void setRegistableDisable(WidgetRef ref) {
  final notifier = ref.read(registableProvider.notifier);
  notifier.state = false;
}

Future<void> updateData(Category newCategory, String categoryType) async {
  if (categoryType == "hikidashi") {
    await updateHikidashi(newCategory);
  }
  if (categoryType == "shoppingPlace") {
    await updateShoppingPlace(newCategory);
  }
}
