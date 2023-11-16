import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/categories_page/add_dialog.dart';
import './category_button.dart';
import '../../pages/categories_page.dart';
import '../../../util/classes/category.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/functions/get_title.dart';
import '../../../util/developper_setting/values.dart';
import '../../../db/basic_crud.dart';

final isAddableProvider = StateProvider<bool>((ref) {
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
    final isAddable = ref.watch(isAddableProvider);
    final formText = ref.watch(formTextProvider);

    void onChanged(String text) {
      final notifireText = ref.read(formTextProvider.notifier);
      notifireText.state = text;
      final notifierIsAddable = ref.read(isAddableProvider.notifier);
      if (text == "") {
        notifierIsAddable.state = false;
      } else if (text.length > textLengthLimit) {
        notifierIsAddable.state = false;
      } else {
        notifierIsAddable.state = true;
      }
    }

    void onTapCancell() {
      Navigator.pop(context);
    }

    Future<void> onTapAdd() async {
      if (isAddable) {
        var newCategory = Category(name: formText);
        await insertData(newCategory, categoryType);
        await getData(categoryType, ref);
        Future.delayed(Duration.zero, () {
          final notifier = ref.read(isAddableProvider.notifier);
          notifier.state = false;
          Navigator.pop(context);
        });
      }
    }

    String? validator(String? value) {
      debugPrint("validate");
      if (value == "" || value == null) {
        return "名前を入力してください";
      } else if (value.length > textLengthLimit) {
        return '${(textLengthLimit)}文字以下で入力してください';
      } else {
        return null;
      }
    }

    return AddDialog(
      title: '${getTitle(categoryType)}を登録',
      formLabel: '${getTitle(categoryType)}名',
      buttonColor: getDarkColor(categoryType),
      isAddable: isAddable,
      onChanged: onChanged,
      onTapCancell: onTapCancell,
      onTapAdd: onTapAdd,
      validator: validator,
    );
  }
}

Future<void> insertData(Category newCategory, String categoryType) async {
  if (categoryType == "hikidashi") {
    await insertHikidashi(newCategory);
  }
  if (categoryType == "shoppingPlace") {
    await insertShoppingPlace(newCategory);
  }
}

void setIsAddable(String text, WidgetRef ref) {
  final notifier = ref.read(isAddableProvider.notifier);
  if (text == "") {
    notifier.state = false;
  } else {
    notifier.state = true;
  }
}
