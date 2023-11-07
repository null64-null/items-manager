import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../db/crud.dart';
import './category_add_dialog.dart';
import '../../button/categorys_page/category_button.dart';
import '../../../pages/categories_page.dart';
import '../../../../util/classes/category.dart';

class InsertButton extends ConsumerWidget {
  final String categoryType;

  const InsertButton({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registable = ref.watch(registableProvider);
    final formText = ref.watch(formTextProvider);

    return GestureDetector(
      child: Text("登録", style: registerTextStyle(registable)),
      onTap: () async {
        if (registable) {
          var newCategory = Category(name: formText);
          await insertData(newCategory, categoryType);
          await getData(categoryType, ref);
          Future.delayed(Duration.zero, () {
            final notifier = ref.read(registableProvider.notifier);
            notifier.state = false;
            Navigator.pop(context);
          });
        }
      },
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

TextStyle registerTextStyle(bool registable) {
  return TextStyle(
    color: registable ? Colors.blue[800]! : Colors.black26,
    fontWeight: FontWeight.w600,
  );
}
