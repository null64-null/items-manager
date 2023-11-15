import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../atoms/app_bar.dart';
import '../molecules/item_edit_page/add_buttons_section.dart';
import '../molecules/item_edit_page/labeled_select_form.dart';
import '../molecules/item_edit_page/labeled_text_editor.dart';
import '../molecules/item_edit_page/update_buttons.section.dart';
import '../pages/item_edit_page.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../db/basic_crud.dart';

const Item initialItem = Item(
  name: "",
  remainingValue: 0,
  maxValue: 0,
  unit: "",
);

final itemEditProvider = StateProvider<Item>((ref) {
  return initialItem;
});

class ItemEditPageTemplate extends ConsumerWidget {
  final int categoryId;
  final String categoryType;
  final Item? initialItem;

  const ItemEditPageTemplate({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
    this.initialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemEdit = ref.watch(itemEditProvider);
    final hikidashiOptins = ref.watch(hikidashiOptinsProvider);
    final shoppingPlaceOptions = ref.watch(shoppingPlaceOptinsProvider);

    void onNameChanged(String text) {
      final notifire = ref.read(itemEditProvider.notifier);
      notifire.state = itemEdit.copyWith(name: text);
    }

    void onHikidashiChanged(int value) {
      final notifier = ref.read(itemEditProvider.notifier);
      notifier.state = itemEdit.copyWith(hikidashiId: value);
    }

    void onShoppingPlaceChanged(int value) {
      final notifier = ref.read(itemEditProvider.notifier);
      notifier.state = itemEdit.copyWith(shoppingPlaceId: value);
    }

    void onMaxValueChanged(String text) {
      if (text != "") {
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(maxValue: double.parse(text));
      }
    }

    void onRemainingValueChanged(String text) {
      if (text != "") {
        final notifire = ref.read(itemEditProvider.notifier);
        notifire.state = itemEdit.copyWith(remainingValue: double.parse(text));
      }
    }

    void onUnitChanged(String text) {
      final notifire = ref.read(itemEditProvider.notifier);
      notifire.state = itemEdit.copyWith(unit: text);
    }

    void onCancellPressed() {
      Navigator.pop(context);
    }

    void onAddPressed() {
      addData(itemEdit);
      Navigator.pop(context);
    }

    void onDeletePressed() {
      deleteData(itemEdit.id!);
      Navigator.pop(context);
    }

    void onUpdatePressed() {
      updateData(itemEdit);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: initialItem == null ? "アイテムを追加" : "${initialItem?.name}を編集",
        color: getColor(categoryType),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(0, -0.8),
            child: LabeledTextEditor(
              width: 210,
              title: "名前",
              initialValue: itemEdit.name,
              isNumeric: false,
              placeholder: "名前を入力",
              onChanged: onNameChanged,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: LabeledSelectForm(
              title: "ひきだし",
              options: optionItems(hikidashiOptins),
              onChanged: onHikidashiChanged,
              value: itemEdit.hikidashiId,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.28),
            child: LabeledSelectForm(
              title: "買う場所",
              options: optionItems(shoppingPlaceOptions),
              onChanged: onShoppingPlaceChanged,
              value: itemEdit.shoppingPlaceId,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0),
            child: LabeledTextEditor(
              title: "必要量",
              initialValue: itemEdit.maxValue.toString(),
              isNumeric: true,
              placeholder: "必要量を入力",
              onChanged: onMaxValueChanged,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.20),
            child: LabeledTextEditor(
              title: "残りの量",
              initialValue: itemEdit.remainingValue.toString(),
              isNumeric: true,
              placeholder: "残りの量を入力",
              onChanged: onRemainingValueChanged,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.4),
            child: LabeledTextEditor(
              title: "単位",
              initialValue: itemEdit.unit,
              isNumeric: false,
              placeholder: "単位を入力",
              onChanged: onUnitChanged,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: itemEdit.id == null
                ? AddButtonsSection(
                    color: getDarkColor(categoryType),
                    onCancellPressed: onCancellPressed,
                    onAddPressed: onAddPressed,
                  )
                : UpdateButtonsSection(
                    color: getDarkColor(categoryType),
                    onCancellPressed: onCancellPressed,
                    onDeletePressed: onDeletePressed,
                    onUpdatePressed: onUpdatePressed,
                  ),
          ),
        ],
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
          child: Text(
            e.name,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      )
      .toList();
  return optionItems;
}

/*

final snackBar = SnackBar(
                        content: Text('Snackbarのメッセージ'),
                        action: SnackBarAction(
                          label: "action",
                          onPressed: () {
                            // アクションが押された時の処理
                            print('アクションが押されました');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);


*/