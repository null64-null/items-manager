import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../molecules/categories_page/box_botton.dart';
import '../../../../util/classes/category.dart';

const Category initialCategory =
    Category(id: 0, name: "name", notifications: 0);

final formTextProvider = StateProvider<String>((ref) {
  return "";
});

class CategoryButton extends ConsumerWidget {
  final Category buttonItem;
  final Color buttonColor;
  final String categoryType;

  const CategoryButton({
    Key? key,
    this.buttonItem = initialCategory,
    this.buttonColor = Colors.white,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoxButton(
      label: buttonItem.name,
      color: buttonColor,
      notifications: buttonItem.notifications ?? 0,
      onPressed: () {
        final notifire = ref.read(formTextProvider.notifier);
        notifire.state = "";
        buttonItem.onPressed(context, categoryType);
      },
      onLongPressed: () {
        final notifire = ref.read(formTextProvider.notifier);
        notifire.state = buttonItem.name;
        buttonItem.onLongPressed(context, categoryType);
      },
    );
  }
}
