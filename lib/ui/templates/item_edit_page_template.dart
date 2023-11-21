import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/util/snack_bar/item_edit_page/after_item_edit_page_snack_bar.dart';
import '../atoms/app_bar.dart';
import '../molecules/item_edit_page/add_buttons_section.dart';
import '../molecules/item_edit_page/labeled_select_form.dart';
import '../molecules/item_edit_page/labeled_text_editor.dart';
import '../molecules/item_edit_page/update_buttons_section.dart';
import '../pages/categories_page.dart';
import '../pages/item_edit_page.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/values.dart/initial_values.dart';
import '../../util/developper_setting/values.dart';
import '../../db/basic_crud.dart';

final _formKey = GlobalKey<FormState>();

final itemEditProvider = StateProvider<Item>((ref) {
  return itemInit;
});

final isActiveProvider = StateProvider<bool>((ref) {
  return false;
});

class ItemEditPageTemplate extends ConsumerWidget {
  final int categoryId;
  final String categoryType;
  final Item initialItem;

  const ItemEditPageTemplate({
    Key? key,
    this.categoryId = 0,
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

    void onNameChanged(String text) {
      final notifire = ref.read(itemEditProvider.notifier);
      notifire.state = itemEdit.copyWith(name: text);
      _formKey.currentState!.validate();
      setIsActive(itemEdit.copyWith(name: text), ref);
    }

    void onHikidashiChanged(value) {
      final notifier = ref.read(itemEditProvider.notifier);
      notifier.state = itemEdit.copyWith(hikidashiId: value);
    }

    void onShoppingPlaceChanged(value) {
      final notifier = ref.read(itemEditProvider.notifier);
      notifier.state = itemEdit.copyWith(shoppingPlaceId: value);
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
        addData(itemEdit);
        afterItemAddSnackBar(
          newItem: itemEdit,
          initialItem: initialItem,
          categoryType: categoryType,
          categories: categories,
          backgroundColor: Colors.blue,
          context: context,
        );
        final notifire = ref.read(isActiveProvider.notifier);
        notifire.state = false;
        Navigator.pop(context);
      }
    }

    void onDeletePressed() {
      deleteData(itemEdit.id!);
      afterItemDeleteSnackBar(
        newItem: itemEdit,
        context: context,
        backgroundColor: Colors.blue,
      );
      Navigator.pop(context);
    }

    void onUpdatePressed() {
      if (isActive) {
        updateData(itemEdit);
        afterItemEditSnackBar(
          newItem: itemEdit,
          initialItem: initialItem,
          categoryType: categoryType,
          categories: categories,
          backgroundColor: Colors.blue,
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
      } else if (double.parse(value) < itemEdit.remainingValue) {
        return '残りの量 < 必要量 としてください';
      } else {
        return null;
      }
    }

    String? validatorRemainingValue(String? value) {
      if (value == "" || value == null) {
        return '値を入力してください';
      } else if (double.parse(value) > 99) {
        return '100未満の値を入力してください';
      } else if (double.parse(value) > itemEdit.maxValue) {
        return '残りの量 < 必要量 としてください';
      } else {
        return null;
      }
    }

    return Scaffold(
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
                title: "ひきだし",
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

Future<void> addData(Item item) async {
  await insertItem(item);
}

Future<void> updateData(Item item) async {
  await updateItem(item);
}

Future<void> deleteData(int id) async {
  await deleteItem(id);
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

  // numeric empth check
  if (itemEdit.remainingValue < 0 || itemEdit.remainingValue < 0) {
    isActive = false;
  }

  // numeric < 99 check
  if (itemEdit.remainingValue > 99 || itemEdit.maxValue > 99) {
    isActive = false;
  }

  // maxValue > remainingValue check
  if (itemEdit.maxValue < itemEdit.remainingValue) {
    isActive = false;
  }

  notifire.state = isActive;
}
