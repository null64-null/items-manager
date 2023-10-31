import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/organisms/button/category_button.dart';
import '../../../db/crud.dart';
import '../../../util/classes/category.dart';
import '../../pages/categories_list_page.dart';

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
          child: Text(
            "キャンセル",
            style: TextStyle(
              color: Colors.blue[800]!,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text(
            "登録",
            style: TextStyle(
              color: registable ? Colors.blue[800]! : Colors.black26,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () async {
            if (registable) {
              var newCategory = Category(name: formText);
              if (categoryType == "hikidashi") {
                await insertHikidashi(newCategory);
              }
              if (categoryType == "shoppingPlace") {
                await insertShoppingPlace(newCategory);
              }
              await getData(categoryType, ref);
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
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
}
