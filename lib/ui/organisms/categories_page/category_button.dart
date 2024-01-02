import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/categories_page/badge_box_button.dart';
import './category_edit_dialog.dart';
import '../../pages/items_page.dart';
import '../../../util/classes/category.dart';
import '../../../util/functions/get_color.dart';
import '../../../util/values/initial_values.dart';

final formTextProvider = StateProvider<String>((ref) {
  return "";
});

class CategoryButton extends ConsumerWidget {
  final Category category;
  final String categoryType;
  final int notifications;
  final bool disabled;

  const CategoryButton({
    Key? key,
    this.category = categoryInit,
    this.categoryType = "",
    this.notifications = 0,
    this.disabled = false,
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
              categoryId: category.id,
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
              categoryId: category.id,
              categoryName: category.name,
            ),
          ),
        );
      }
    }

    void onLongPressed() {
      if (category.id != null) {
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
    }

    return BadgeBoxButton(
      label: category.name,
      color: category.id == null ? Colors.grey[300]! : getColor(categoryType),
      badgeValue: notifications,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
      disabled: disabled,
    );
  }
}
