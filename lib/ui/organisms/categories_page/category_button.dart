import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/categories_page/badge_botton.dart';
import './category_edit_dialog.dart';
import '../../pages/items_page.dart';
import '../../../../util/classes/category.dart';
import '../../../../util/functions/get_color.dart';

const Category initialCategory =
    Category(id: 0, name: "name", notifications: 0);

final formTextProvider = StateProvider<String>((ref) {
  return "";
});

class CategoryButton extends ConsumerWidget {
  final Category category;
  final String categoryType;

  const CategoryButton({
    Key? key,
    this.category = initialCategory,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifire = ref.read(formTextProvider.notifier);
      notifire.state = "";
      if (categoryType == "hikidashi") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsPage(
              categoryType: "hikidashi",
              categoryId: category.id!,
              categoryName: category.name,
            ),
          ),
        );
      }
      if (categoryType == "shoppingPlace") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsPage(
              categoryType: "shoppingPlace",
              categoryId: category.id!,
              categoryName: category.name,
            ),
          ),
        );
      }
    }

    void onLongPressed() {
      final notifire = ref.read(formTextProvider.notifier);
      notifire.state = category.name;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CategoryEditDialog(
            categoryType: categoryType,
            categoryId: category.id!,
          );
        },
      );
    }

    return BadgeButton(
      label: category.name,
      color: getColor(categoryType),
      notifications: category.notifications ?? 0,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
    );
  }
}
