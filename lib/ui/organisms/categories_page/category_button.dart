import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../molecules/categories_page/badge_botton.dart';
import '../../../../util/classes/category.dart';
import '../../../../util/functions/get_color.dart';

const Category initialCategory =
    Category(id: 0, name: "name", notifications: 0);

final formTextProvider = StateProvider<String>((ref) {
  return "";
});

class CategoryButton extends ConsumerWidget {
  final Category buttonItem;
  final String categoryType;

  const CategoryButton({
    Key? key,
    this.buttonItem = initialCategory,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifire = ref.read(formTextProvider.notifier);
      notifire.state = "";
      buttonItem.onPressed(context, categoryType);
    }

    void onLongPressed() {
      final notifire = ref.read(formTextProvider.notifier);
      notifire.state = buttonItem.name;
      buttonItem.onLongPressed(context, categoryType);
    }

    return BadgeButton(
      label: buttonItem.name,
      color: getColor(categoryType),
      notifications: buttonItem.notifications ?? 0,
      onPressed: onPressed,
      onLongPressed: onLongPressed,
    );
  }
}
