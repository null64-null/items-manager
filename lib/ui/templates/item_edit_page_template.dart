import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/db/get_notifications.dart';
import '../atoms/app_bar.dart';
import '../molecules/item_edit_page/add_buttons_section.dart';
import '../molecules/item_edit_page/labeled_select_form.dart';
import '../molecules/item_edit_page/labeled_text_editor.dart';
import '../molecules/item_edit_page/update_buttons_section.dart';
import '../organisms/item_edit_page/delete_confirmation_dialog.dart';
import '../pages/categories_page.dart';
import '../pages/items_page.dart';
import '../pages/item_edit_page.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/values/initial_values.dart';
import '../../util/developper_setting/values.dart';
import '../../util/snack_bar/item_edit_page/after_item_edit_page_snack_bar.dart';
import '../../db/basic_crud.dart';

final _formKey = GlobalKey<FormState>();

final itemEditProvider = StateProvider<Item>((ref) {
  return itemInit;
});

final isActiveProvider = StateProvider<bool>((ref) {
  return false;
});

class ItemEditPageTemplate extends ConsumerWidget {
  final String categoryType;
  final Item initialItem;

  const ItemEditPageTemplate({
    Key? key,
    this.categoryType = "",
    this.initialItem = itemInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemEdit = ref.watch(itemEditProvider);
    final hikidashiOptins = ref.watch(hikidashiOptinsProvider);
    final shoppingPlaceOptions = ref.watch(shoppingPlaceOptinsProvider);
    final categories = ref.watch(categoriesProvider);
    final isActive = ref.watch(isActiveProvider);
    final items = ref.watch(itemsProvider);

    void onNameChanged(String text) {
      final notifire = ref.read(itemEditProvider.notifier);
      notifire.state = itemEdit.copyWith(name: text);
      _formKey.currentState!.validate();
      setIsActive(itemEdit.copyWith(name: text), ref);
    }

    void onHikidashiChanged(value) {
      final notifier = ref.read(itemEditProvider.notifier);
      if (value == null) {
        notifier.state = Item(
          id: itemEdit.id,
          name: itemEdit.name,
          remainingValue: itemEdit.remainingValue,
          maxValue: itemEdit.maxValue,
          unit: itemEdit.unit,
          hikidashiId: null,
          shoppingPlaceId: itemEdit.shoppingPlaceId,
          hikidashiNum: itemEdit.hikidashiNum,
          shoppingPlaceNum: itemEdit.shoppingPlaceNum,
        );
      } else {
        notifier.state = itemEdit.copyWith(hikidashiId: value);
      }
    }

    void onShoppingPlaceChanged(value) {
      final notifier = ref.read(itemEditProvider.notifier);
      if (value == null) {
        notifier.state = Item(
          id: itemEdit.id,
          name: itemEdit.name,
          remainingValue: itemEdit.remainingValue,
          maxValue: itemEdit.maxValue,
          unit: itemEdit.unit,
          hikidashiId: itemEdit.hikidashiId,
          shoppingPlaceId: null,
          hikidashiNum: itemEdit.hikidashiNum,
          shoppingPlaceNum: itemEdit.shoppingPlaceNum,
        );
      } else {
        notifier.state = itemEdit.copyWith(shoppingPlaceId: value);
      }
    }

    void onMaxValueChanged(String text) {
      if (text == "") {
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(maxValue: -1);
        setIsActive(itemEdit.copyWith(maxValue: -1), ref);
      } else {
        final value = double.parse(text);
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(maxValue: value);
        setIsActive(itemEdit.copyWith(maxValue: value), ref);
      }
      _formKey.currentState!.validate();
    }

    void onRemainingValueChanged(String text) {
      if (text == "") {
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(remainingValue: -1);
        setIsActive(itemEdit.copyWith(remainingValue: -1), ref);
      } else {
        final value = double.parse(text);
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(remainingValue: value);
        setIsActive(itemEdit.copyWith(remainingValue: value), ref);
      }
      _formKey.currentState!.validate();
    }

    void onUnitChanged(String text) {
      final notifire = ref.read(itemEditProvider.notifier);
      notifire.state = itemEdit.copyWith(unit: text);
      _formKey.currentState!.validate();
      setIsActive(itemEdit.copyWith(unit: text), ref);
    }

    void onCancellPressed() {
      Navigator.pop(context);
    }

    void onAddPressed() {
      if (isActive) {
        addData(
          item: itemEdit,
          items: items,
          initialItem: initialItem,
          categories: categories,
          categoryType: categoryType,
          ref: ref,
        );
        if (categoryType == "hikidashi") {
          afterItemAddSnackBar(
            newItem: itemEdit.copyWith(hikidashiNum: items.length),
            initialItem: initialItem,
            categoryType: categoryType,
            categories: categories,
            backgroundColor: getDarkColor(categoryType),
            context: context,
          );
        }
        if (categoryType == "shoppingPlace") {
          afterItemAddSnackBar(
            newItem: itemEdit.copyWith(shoppingPlaceNum: items.length),
            initialItem: initialItem,
            categoryType: categoryType,
            categories: categories,
            backgroundColor: getDarkColor(categoryType),
            context: context,
          );
        }

        final notifire = ref.read(isActiveProvider.notifier);
        notifire.state = false;
        Navigator.pop(context);
      }
    }

    void onDeletePressed() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return DeleteConfirmationDialog(
            itemName: initialItem.name,
            buttonColor: getDarkColor(categoryType),
            onTapCancell: () {
              Navigator.pop(context);
            },
            onTapDelete: () {
              deleteData(
                item: itemEdit,
                items: items,
                categories: categories,
                categoryType: categoryType,
                ref: ref,
              );
              afterItemDeleteSnackBar(
                newItem: itemEdit,
                context: context,
                backgroundColor: getDarkColor(categoryType),
              );
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        },
      );
    }

    void onUpdatePressed() {
      if (isActive) {
        updateData(
          item: itemEdit,
          initialItem: initialItem,
          items: items,
          categories: categories,
          categoryType: categoryType,
          ref: ref,
        );
        afterItemEditSnackBar(
          newItem: itemEdit,
          initialItem: initialItem,
          categoryType: categoryType,
          categories: categories,
          backgroundColor: getDarkColor(categoryType),
          context: context,
        );
        final notifire = ref.read(isActiveProvider.notifier);
        notifire.state = false;
        Navigator.pop(context);
      }
    }

    String? validatorString(String? value) {
      if (value == "" || value == null) {
        return "入力してください";
      }
      if (value.length > textLengthLimit) {
        return '${(textLengthLimit)}文字以下で入力してください';
      }
      return null;
    }

    String? validatorMaxValue(String? value) {
      if (value == "" || value == null) {
        return '値を入力してください';
      } else if (double.parse(value) > 99) {
        return '100未満の値を入力してください';
      } else if (double.parse(value) == 0) {
        return '0より大きい値を入力してください';
      }
      /*else if (double.parse(value) < itemEdit.remainingValue) {
        return '残りの量 < 必要量 としてください';
      }*/
      else {
        return null;
      }
    }

    String? validatorRemainingValue(String? value) {
      if (value == "" || value == null) {
        return '値を入力してください';
      } else if (double.parse(value) > 99) {
        return '100未満の値を入力してください';
      } /* else if (double.parse(value) > itemEdit.maxValue) {
        return '残りの量 < 必要量 としてください';
      }*/
      else {
        return null;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: initialItem.id == null ? "アイテムを追加" : "${initialItem.name}を編集",
        color: getColor(categoryType),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: const Alignment(0, -0.9),
              child: LabeledTextEditor(
                width: 210,
                title: "名前",
                initialValue: itemEdit.name,
                isNumeric: false,
                placeholder: "名前を入力",
                onChanged: onNameChanged,
                validator: validatorString,
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.6),
              child: LabeledSelectForm(
                title: "収納場所",
                options: optionItems(hikidashiOptins),
                onChanged: onHikidashiChanged,
                value: itemEdit.hikidashiId,
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.38),
              child: LabeledSelectForm(
                title: "買う場所",
                options: optionItems(shoppingPlaceOptions),
                onChanged: onShoppingPlaceChanged,
                value: itemEdit.shoppingPlaceId,
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.1),
              child: LabeledTextEditor(
                width: 210,
                title: "必要量",
                initialValue: itemEdit.maxValue.toString(),
                isNumeric: true,
                placeholder: "必要量を入力",
                onChanged: onMaxValueChanged,
                validator: validatorMaxValue,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.25),
              child: LabeledTextEditor(
                width: 210,
                title: "残りの量",
                initialValue: itemEdit.remainingValue.toString(),
                isNumeric: true,
                placeholder: "残りの量を入力",
                onChanged: onRemainingValueChanged,
                validator: validatorRemainingValue,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.6),
              child: LabeledTextEditor(
                width: 210,
                title: "単位",
                initialValue: itemEdit.unit,
                isNumeric: false,
                placeholder: "単位を入力",
                onChanged: onUnitChanged,
                validator: validatorString,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.85),
              child: itemEdit.id == null
                  ? AddButtonsSection(
                      color: getDarkColor(categoryType),
                      onCancellPressed: onCancellPressed,
                      onAddPressed: onAddPressed,
                      isActive: isActive,
                    )
                  : UpdateButtonsSection(
                      color: getDarkColor(categoryType),
                      onCancellPressed: onCancellPressed,
                      onDeletePressed: onDeletePressed,
                      onUpdatePressed: onUpdatePressed,
                      isActive: isActive,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> addData({
  required Item item,
  required Item initialItem,
  required List<Item> items,
  required List<Category> categories,
  required String categoryType,
  required WidgetRef ref,
}) async {
  List<Item> itemsInNewHikidashi =
      await getItemsFromHikidashi(item.hikidashiId);
  List<Item> itemsInNewShoppingPlace =
      await getItemsFromShoppingPlace(item.shoppingPlaceId);
  final itemAdd = item.copyWith(
    hikidashiNum: itemsInNewHikidashi.length,
    shoppingPlaceNum: itemsInNewShoppingPlace.length,
  );
  await insertItem(itemAdd);
  await fetchData(
    categories: categories,
    categoryType: categoryType,
    ref: ref,
  );
}

Future<void> updateData({
  required Item item,
  required Item initialItem,
  required List<Item> items,
  required List<Category> categories,
  required String categoryType,
  required WidgetRef ref,
}) async {
  if (item.hikidashiId != initialItem.hikidashiId &&
      item.shoppingPlaceId == initialItem.shoppingPlaceId) {
    for (int i = item.hikidashiNum! + 1; i < items.length; i++) {
      await updateItem(
          items[i].copyWith(hikidashiNum: items[i].hikidashiNum! - 1));
    }

    List<Item> itemsInNewHikidashi =
        await getItemsFromHikidashi(item.hikidashiId);
    Item newItem = item.copyWith(hikidashiNum: itemsInNewHikidashi.length);

    updateItem(newItem);
  }

  if (item.hikidashiId == initialItem.hikidashiId &&
      item.shoppingPlaceId != initialItem.shoppingPlaceId) {
    for (int i = item.shoppingPlaceNum! + 1; i < items.length; i++) {
      await updateItem(
          items[i].copyWith(shoppingPlaceNum: items[i].shoppingPlaceNum! - 1));
    }

    List<Item> itemsInNewShoppingPlace =
        await getItemsFromShoppingPlace(item.shoppingPlaceId);
    Item newItem =
        item.copyWith(shoppingPlaceNum: itemsInNewShoppingPlace.length);

    updateItem(newItem);
  }

  if (item.hikidashiId != initialItem.hikidashiId &&
      item.shoppingPlaceId != initialItem.shoppingPlaceId) {
    if (categoryType == "hikidashi") {
      for (int i = item.hikidashiNum! + 1; i < items.length; i++) {
        await updateItem(
            items[i].copyWith(hikidashiNum: items[i].hikidashiNum! - 1));
      }
      List<Item> itemsInPreviousShoppingPlace =
          await getItemsFromShoppingPlace(initialItem.shoppingPlaceId);
      for (int i = item.shoppingPlaceNum! + 1;
          i < itemsInPreviousShoppingPlace.length;
          i++) {
        await updateItem(itemsInPreviousShoppingPlace[i].copyWith(
            shoppingPlaceNum:
                itemsInPreviousShoppingPlace[i].shoppingPlaceNum! - 1));
      }
    }

    if (categoryType == "shoppingPlace") {
      for (int i = item.shoppingPlaceNum! + 1; i < items.length; i++) {
        await updateItem(items[i]
            .copyWith(shoppingPlaceNum: items[i].shoppingPlaceNum! - 1));
      }
      List<Item> itemsInPreviousHikidashi =
          await getItemsFromHikidashi(initialItem.hikidashiId);
      for (int i = item.hikidashiNum! + 1;
          i < itemsInPreviousHikidashi.length;
          i++) {
        await updateItem(itemsInPreviousHikidashi[i].copyWith(
            hikidashiNum: itemsInPreviousHikidashi[i].hikidashiNum! - 1));
      }
    }

    List<Item> itemsInNewHikidashi =
        await getItemsFromHikidashi(item.hikidashiId);
    List<Item> itemsInNewShoppingPlace =
        await getItemsFromShoppingPlace(item.shoppingPlaceId);
    Item newItem = item.copyWith(
      hikidashiNum: itemsInNewHikidashi.length,
      shoppingPlaceNum: itemsInNewShoppingPlace.length,
    );

    updateItem(newItem);
  }

  if (item.hikidashiId == initialItem.hikidashiId &&
      item.shoppingPlaceId == initialItem.shoppingPlaceId) {
    await updateItem(item);
  }

  await fetchData(
    categories: categories,
    categoryType: categoryType,
    ref: ref,
  );
}

Future<void> deleteData({
  required Item item,
  required List<Item> items,
  required List<Category> categories,
  required String categoryType,
  required WidgetRef ref,
}) async {
  if (categoryType == "hikidashi") {
    for (int i = item.hikidashiNum! + 1; i < items.length; i++) {
      await updateItem(
          items[i].copyWith(hikidashiNum: items[i].hikidashiNum! - 1));
    }
    await deleteItem(item.id!);
  }
  if (categoryType == "shoppingPlace") {
    for (int i = item.shoppingPlaceNum! + 1; i < items.length; i++) {
      await updateItem(
          items[i].copyWith(shoppingPlaceNum: items[i].shoppingPlaceNum! - 1));
    }
    await deleteItem(item.id!);
  }
  await fetchData(
    categories: categories,
    categoryType: categoryType,
    ref: ref,
  );
}

Future<void> fetchData({
  required List<Category> categories,
  required String categoryType,
  required WidgetRef ref,
}) async {
  final itemsNotifire = ref.read(itemsProvider.notifier);
  final newItems = await getItems();
  itemsNotifire.state = newItems;

  final notificationsArrayNotifire =
      ref.read(notificationsArrayProvider.notifier);
  final newNotificationsArray =
      await getNotifications(categories, categoryType);
  notificationsArrayNotifire.state = newNotificationsArray;
}

List<DropdownMenuItem<dynamic>>? optionItems(List<Category> options) {
  final optionItems = options
      .map(
        (e) => DropdownMenuItem(
          value: e.id,
          child: SizedBox(
            width: 160,
            child: Text(
              e.name,
              style: const TextStyle(
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      )
      .toList();
  return optionItems;
}

void initializeIsActive(int? id, WidgetRef ref) {
  if (id == null) {
    final notifire = ref.read(isActiveProvider.notifier);
    notifire.state = false;
  } else {
    final notifire = ref.read(isActiveProvider.notifier);
    notifire.state = true;
  }
}

void setIsActive(Item itemEdit, WidgetRef ref) {
  final notifire = ref.read(isActiveProvider.notifier);
  var isActive = true;

  // string empty check
  if (itemEdit.name == "" || itemEdit.unit == "") {
    isActive = false;
  }

  // string length check
  if (itemEdit.name.length > textLengthLimit ||
      itemEdit.unit.length > textLengthLimit) {
    isActive = false;
  }

  // numeric empty check
  if (itemEdit.remainingValue < 0 || itemEdit.maxValue <= 0) {
    isActive = false;
  }

  // numeric < 99 check
  if (itemEdit.remainingValue > 99 || itemEdit.maxValue > 99) {
    isActive = false;
  }

  // maxValue > remainingValue check
  /*
  if (itemEdit.maxValue < itemEdit.remainingValue) {
    isActive = false;
  }
  */

  notifire.state = isActive;
}
