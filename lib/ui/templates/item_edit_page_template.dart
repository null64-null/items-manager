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
import '../../db/crud.dart';

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

  const ItemEditPageTemplate({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemEdit = ref.watch(itemEditProvider);
    final hikidashiOptins = ref.watch(hikidashiOptinsProvider);
    final shoppingPlaceOptions = ref.watch(shoppingPlaceOptinsProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: categoryId.toString(),
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
              onChanged: (text) {
                final notifire = ref.read(itemEditProvider.notifier);
                notifire.state = Item(
                  id: itemEdit.id,
                  name: text,
                  remainingValue: itemEdit.remainingValue,
                  maxValue: itemEdit.maxValue,
                  unit: itemEdit.unit,
                  hikidashiId: itemEdit.hikidashiId,
                  shoppingPlaceId: itemEdit.shoppingPlaceId,
                );
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.5),
            child: LabeledSelectForm(
              title: "ひきだし",
              options: optionItems(hikidashiOptins),
              onChanged: (value) {
                final notifier = ref.read(itemEditProvider.notifier);
                notifier.state = Item(
                  id: itemEdit.id,
                  name: itemEdit.name,
                  remainingValue: itemEdit.remainingValue,
                  maxValue: itemEdit.maxValue,
                  unit: itemEdit.unit,
                  hikidashiId: value,
                  shoppingPlaceId: itemEdit.shoppingPlaceId,
                );
              },
              value: itemEdit.hikidashiId,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.28),
            child: LabeledSelectForm(
              title: "買う場所",
              options: optionItems(shoppingPlaceOptions),
              onChanged: (value) {
                final notifier = ref.read(itemEditProvider.notifier);
                notifier.state = Item(
                  id: itemEdit.id,
                  name: itemEdit.name,
                  remainingValue: itemEdit.remainingValue,
                  maxValue: itemEdit.maxValue,
                  unit: itemEdit.unit,
                  hikidashiId: itemEdit.hikidashiId,
                  shoppingPlaceId: value,
                );
              },
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
              onChanged: (text) {
                if (text != "") {
                  final notifire = ref.read(itemEditProvider.notifier);
                  notifire.state = Item(
                    id: itemEdit.id,
                    name: itemEdit.name,
                    remainingValue: itemEdit.remainingValue,
                    maxValue: double.parse(text),
                    unit: itemEdit.unit,
                    hikidashiId: itemEdit.hikidashiId,
                    shoppingPlaceId: itemEdit.shoppingPlaceId,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.20),
            child: LabeledTextEditor(
              title: "残りの量",
              initialValue: itemEdit.remainingValue.toString(),
              isNumeric: true,
              placeholder: "残りの量を入力",
              onChanged: (text) {
                if (text != "") {
                  final notifire = ref.read(itemEditProvider.notifier);
                  notifire.state = Item(
                    id: itemEdit.id,
                    name: itemEdit.name,
                    remainingValue: double.parse(text),
                    maxValue: itemEdit.maxValue,
                    unit: itemEdit.unit,
                    hikidashiId: itemEdit.hikidashiId,
                    shoppingPlaceId: itemEdit.shoppingPlaceId,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.4),
            child: LabeledTextEditor(
              title: "単位",
              initialValue: itemEdit.unit,
              isNumeric: false,
              placeholder: "単位を入力",
              onChanged: (text) {
                final notifire = ref.read(itemEditProvider.notifier);
                notifire.state = Item(
                  id: itemEdit.id,
                  name: itemEdit.name,
                  remainingValue: itemEdit.remainingValue,
                  maxValue: itemEdit.maxValue,
                  unit: text,
                  hikidashiId: itemEdit.hikidashiId,
                  shoppingPlaceId: itemEdit.shoppingPlaceId,
                );
              },
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: itemEdit.id == null
                ? AddButtonsSection(
                    color: Colors.blue,
                    onCancellPressed: () {},
                    onAddPressed: () {
                      addData(itemEdit);
                      debugPrint("insert");
                    },
                  )
                : UpdateButtonsSection(
                    color: Colors.blue,
                    onCancellPressed: () {},
                    onDeletePressed: () {},
                    onUpdatePressed: () {},
                  ),
          ),
        ],
      ),
    );
  }
}

Future<void> addData(Item item) async {
  debugPrint(item.name);
  await insertItem(item);
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

Color getColor(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return const Color(0xFF54D6FF);
    case "shoppingPlace":
      return const Color(0xFF62FF54);
    default:
      return Colors.white;
  }
}
