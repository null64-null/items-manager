import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/util/values/initial_values.dart';
import '../../molecules/categories_page/edit_dialog.dart';
import './category_button.dart';
import '../../pages/categories_page.dart';
import '../../../util/classes/category.dart';
import '../../../util/classes/items.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/functions/get_title.dart';
import '../../../util/developper_setting/values.dart';
import '../../../db/basic_crud.dart';

final _formKey = GlobalKey<FormState>();

final isUpdatableProvider = StateProvider<bool>((ref) {
  return true;
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
      orElse: () => categoryInit,
    );

    void onChanged(String text) {
      final notifireText = ref.read(formTextProvider.notifier);
      notifireText.state = text;
      final notifireIsUpdatable = ref.read(isUpdatableProvider.notifier);
      if (text == "") {
        notifireIsUpdatable.state = false;
      } else if (text.length > textLengthLimit) {
        notifireIsUpdatable.state = false;
      } else {
        notifireIsUpdatable.state = true;
      }
      _formKey.currentState!.validate();
    }

    void onTapCancell() {
      Navigator.pop(context);
    }

    Future<void> onTapDelete() async {
      await deleteData(category, categories, categoryType, ref);
      Future.delayed(Duration.zero, () {
        final notifier = ref.read(isUpdatableProvider.notifier);
        notifier.state = false;

        Navigator.pop(context);
      });
    }

    Future<void> onTapUpdate() async {
      if (isUpdatable) {
        var newCategory = Category(
          id: category.id,
          name: formText,
          num: category.num,
        );
        await updateData(newCategory, categoryType, ref);
        Future.delayed(Duration.zero, () {
          Navigator.pop(context);
        });
      }
    }

    String? validator(String? value) {
      if (value == "" || value == null) {
        return "名前を入力してください";
      } else if (value.length > textLengthLimit) {
        return '${(textLengthLimit)}文字以下で入力してください';
      } else {
        return null;
      }
    }

    return Form(
      key: _formKey,
      child: EditDialog(
        title: '${getTitle(categoryType)}を編集',
        formLabel: '${getTitle(categoryType)}名',
        buttonColor: getDarkColor(categoryType),
        initialValue: category.name,
        isUpdatable: isUpdatable,
        onChanged: onChanged,
        onTapCancell: onTapCancell,
        onTapDelete: onTapDelete,
        onTapUpdate: onTapUpdate,
        validator: validator,
      ),
    );
  }
}

Future<void> updateData(
    Category newCategory, String categoryType, WidgetRef ref) async {
  if (categoryType == "hikidashi") {
    await updateHikidashi(newCategory);
  }
  if (categoryType == "shoppingPlace") {
    await updateShoppingPlace(newCategory);
  }

  fetchData(categoryType, ref);
}

Future<void> deleteData(
  Category category,
  List<Category> categories,
  String categoryType,
  WidgetRef ref,
) async {
  if (categoryType == "hikidashi") {
    List<Item> itemsNotCategorized = await getItemsFromHikidashi(null);
    List<Item> items = await getItemsFromHikidashi(category.id);
    for (int i = 0; i < items.length; i++) {
      Item updatedItem = Item(
        id: items[i].id,
        name: items[i].name,
        remainingValue: items[i].remainingValue,
        maxValue: items[i].maxValue,
        unit: items[i].unit,
        hikidashiId: null,
        shoppingPlaceId: items[i].shoppingPlaceId,
        hikidashiNum: itemsNotCategorized.length + i,
        shoppingPlaceNum: items[i].shoppingPlaceNum,
      );
      await updateItem(updatedItem);
    }

    for (int i = category.num! + 1; i < categories.length - 1; i++) {
      await updateHikidashi(
          categories[i].copyWith(num: categories[i].num! - 1));
    }
    await deleteHikidashi(category.id!);
  }
  if (categoryType == "shoppingPlace") {
    List<Item> itemsNotCategorized = await getItemsFromShoppingPlace(null);
    List<Item> items = await getItemsFromShoppingPlace(category.id);
    for (int i = 0; i < items.length; i++) {
      Item updatedItem = Item(
        id: items[i].id,
        name: items[i].name,
        remainingValue: items[i].remainingValue,
        maxValue: items[i].maxValue,
        unit: items[i].unit,
        hikidashiId: items[i].hikidashiId,
        shoppingPlaceId: null,
        hikidashiNum: items[i].hikidashiNum,
        shoppingPlaceNum: itemsNotCategorized.length + i,
      );
      await updateItem(updatedItem);
    }

    for (int i = category.num! + 1; i < categories.length - 1; i++) {
      await updateShoppingPlace(
          categories[i].copyWith(num: categories[i].num! - 1));
    }
    await deleteShoppingPlace(category.id!);
  }

  await fetchData(categoryType, ref);
}

Future<void> fetchData(String categoryType, WidgetRef ref) async {
  switch (categoryType) {
    case "hikidashi":
      final hikidashiCategorys = await getHikidashis();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = hikidashiCategorys;
      break;
    case "shoppingPlace":
      final shoppingPlaceCategorys = await getShoppingPlaces();
      final notifire = ref.read(categoriesProvider.notifier);
      notifire.state = shoppingPlaceCategorys;
      break;
    default:
      debugPrint("category type error");
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
