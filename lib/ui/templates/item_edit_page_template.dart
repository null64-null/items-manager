import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/item_edit_page.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';

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
      appBar: appBar(itemEdit, categoryType),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(0, -0.8),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                initialValue: itemEdit.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "名前を入力",
                ),
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
          ),
          Align(
            alignment: const Alignment(-0.5, -0.4),
            child: SizedBox(
              child: DropdownButton(
                items: optionItems(hikidashiOptins),
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
          ),
          Align(
            alignment: const Alignment(0.5, -0.4),
            child: SizedBox(
              child: DropdownButton(
                items: optionItems(shoppingPlaceOptions),
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
          ),
          Align(
            alignment: const Alignment(-0.5, 0),
            child: SizedBox(
              width: 100,
              child: TextFormField(
                initialValue: itemEdit.maxValue.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "必要量を入力",
                ),
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
          ),
          Align(
            alignment: const Alignment(0.5, 0),
            child: SizedBox(
              width: 100,
              child: TextFormField(
                initialValue: itemEdit.remainingValue.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "残りを入力",
                ),
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
          ),
          Align(
            alignment: const Alignment(0, 0.3),
            child: SizedBox(
              width: 150,
              child: TextFormField(
                initialValue: itemEdit.unit,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "単位を入力",
                ),
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
          ),
        ],
      ),
    );
  }
}

AppBar appBar(Item item, String categoryType) {
  return AppBar(
    title: Text(
      item.name == "" ? "アイテムを追加" : item.name,
      style: titleStyle,
    ),
    backgroundColor: getColor(categoryType),
  );
}

TextStyle titleStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

List<DropdownMenuItem<dynamic>>? optionItems(List<Category> options) {
  final optionItems = options
      .map(
        (e) => DropdownMenuItem(value: e.id, child: Text(e.name)),
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
