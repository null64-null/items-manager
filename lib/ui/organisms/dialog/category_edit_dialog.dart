import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/util/classes/category.dart';
import '../../pages/categories_list_page.dart';
import '../../organisms/button/category_button.dart';
import '../../../db/crud.dart';

final buttonFontStyle = TextStyle(
  color: Colors.blue[800]!,
  fontWeight: FontWeight.w600,
);

const buttonFontStyleDisabled = TextStyle(
  color: Colors.black26,
  fontWeight: FontWeight.w600,
);

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
          activateRegist(ref);
        },
      ),
      actions: [
        GestureDetector(
          child: Text(
            "キャンセル",
            style: buttonFontStyle,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text(
            "削除",
            style: buttonFontStyle,
          ),
          onTap: () async {
            activateRegist(ref);
          },
        ),
        GestureDetector(
          child: Text(
            "更新",
            style: registable ? buttonFontStyle : buttonFontStyleDisabled,
          ),
          onTap: () async {
            if (categoryType == "hikidashi") {
              await updateHikidashi(
                Category(
                  id: category.id,
                  name: formText,
                  notifications: category.notifications,
                ),
              );
            }
            if (categoryType == "shoppingPlace") {
              await updateShoppingPlace(
                Category(
                  id: category.id,
                  name: formText,
                  notifications: category.notifications,
                ),
              );
            }
            await getData(categoryType, ref);
            activateRegist(ref);
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
            });
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

  void activateRegist(WidgetRef ref) {
    final notifier = ref.read(registableProvider.notifier);
    notifier.state = true;
  }

  void disactivateRegist(WidgetRef ref) {
    final notifier = ref.read(registableProvider.notifier);
    notifier.state = false;
  }
}
