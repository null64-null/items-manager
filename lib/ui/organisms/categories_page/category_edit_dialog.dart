import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/categories_page/edit_dialog.dart';
import './category_button.dart';
import '../../pages/categories_page.dart';
import '../../../util/classes/category.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/functions/get_title.dart';
import '../../../db/crud.dart';

const Category initialCategory =
    Category(id: 0, name: "name", notifications: 0);

final isUpdatableProvider = StateProvider<bool>((ref) {
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
    final isUpdatable = ref.watch(isUpdatableProvider);
    final categories = ref.watch(categoriesProvider);
    final formText = ref.watch(formTextProvider);
    final Category category = categories.firstWhere(
      (category) => category.id == categoryId,
      orElse: () => initialCategory,
    );

    return EditDialog(
      title: '${getTitle(categoryType)}を編集',
      formLabel: '${getTitle(categoryType)}名',
      buttonColor: getDarkColor(categoryType),
      initialValue: category.name,
      isUpdatable: isUpdatable,
      onChanged: (text) {
        final notifire = ref.read(formTextProvider.notifier);
        notifire.state = text;
        setUpdatable(text, ref);
      },
      onTapCancell: () {
        Navigator.pop(context);
      },
      onTapDelete: () async {
        await deleteData(categoryId, categoryType);
        await getData(categoryType, ref);
        Future.delayed(Duration.zero, () {
          final notifier = ref.read(isUpdatableProvider.notifier);
          notifier.state = false;
          Navigator.pop(context);
        });
      },
      onTapUpdate: () async {
        var newCategory = Category(
          id: category.id,
          name: formText,
          notifications: category.notifications,
        );
        await updateData(newCategory, categoryType);
        await getData(categoryType, ref);
        Future.delayed(Duration.zero, () {
          final notifier = ref.read(isUpdatableProvider.notifier);
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

Future<void> deleteData(int categoryId, String categoryType) async {
  if (categoryType == "hikidashi") {
    await deleteHikidashi(categoryId);
  }
  if (categoryType == "shoppingPlace") {
    await deleteShoppingPlace(categoryId);
  }
}

void setUpdatable(String text, WidgetRef ref) {
  final notifier = ref.read(isUpdatableProvider.notifier);
  if (text == "") {
    notifier.state = false;
  } else {
    notifier.state = true;
  }
}