import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/organisms/button/category_button.dart';
import '../../../../db/crud.dart';
import '../../../../util/classes/category.dart';
import '../../../pages/categories_list_page.dart';

final registrableProvider = StateProvider<bool>((ref) {
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
    final registable = ref.watch(registrableProvider);
    final formText = ref.watch(formTextProvider);

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
        GestureDetector(
          child: Text("キャンセル", style: canselTextStyle),
          onTap: () {
            setRegistableDisable(ref);
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text("登録", style: registerTextStyle(registable)),
          onTap: () async {
            if (registable) {
              var newCategory = Category(name: formText);
              await insertData(newCategory, categoryType);
              await getData(categoryType, ref);
              Future.delayed(Duration.zero, () {
                setRegistableDisable(ref);
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
    );
  }
}

final TextStyle canselTextStyle = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);

TextStyle registerTextStyle(bool registable) {
  return TextStyle(
    color: registable ? Colors.blue[800]! : Colors.black26,
    fontWeight: FontWeight.w600,
  );
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
  final notifier = ref.read(registrableProvider.notifier);
  if (text == "") {
    notifier.state = false;
  } else {
    notifier.state = true;
  }
}

void setRegistableDisable(WidgetRef ref) {
  final notifier = ref.read(registrableProvider.notifier);
  notifier.state = false;
}

Future<void> insertData(Category newCategory, String categoryType) async {
  if (categoryType == "hikidashi") {
    await insertHikidashi(newCategory);
  }
  if (categoryType == "shoppingPlace") {
    await insertShoppingPlace(newCategory);
  }
}
