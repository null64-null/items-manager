import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/classes/items.dart';
import '../../util/classes/category.dart';

const Item initialItem = Item(
  name: "",
  remainingValue: 0,
  maxValue: 0,
  unit: "",
);

const List<Category> initialOptinos = [];

final itemEditProvider = StateProvider<Item>((ref) {
  return initialItem;
});

class ItemEditPageTemplate extends ConsumerWidget {
  final int categoryId;
  final String categoryType;
  final List<Category> hikidashiOptions;
  final List<Category> shoppingPlaceOptions;

  const ItemEditPageTemplate({
    Key? key,
    this.categoryId = 0,
    this.categoryType = "",
    this.hikidashiOptions = initialOptinos,
    this.shoppingPlaceOptions = initialOptinos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemEdit = ref.watch(itemEditProvider);

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
            alignment: const Alignment(0, 0),
            child: SizedBox(
              width: 300,
              child: Text("aaa"),
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
