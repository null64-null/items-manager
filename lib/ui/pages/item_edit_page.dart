import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../templates/item_edit_page_template.dart';
import '../../util/classes/items.dart';

class ItemEditPage extends ConsumerWidget {
  final Item? item;
  final int categoryId;
  final String categoryType;

  const ItemEditPage({
    Key? key,
    this.item,
    this.categoryId = 0,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ItemEditPageTemplate(
      categoryId: categoryId,
      categoryType: categoryType,
    );
  }
}
