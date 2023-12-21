import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../../../util/functions/get_color.dart';
import '../../templates/categories_page_template.dart';
import '../../pages/categories_page.dart';

class CancelReorderButton extends ConsumerWidget {
  final String categoryType;

  const CancelReorderButton({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifierIsBeingReorderd =
          ref.read(isBeingReorderdProvider.notifier);
      notifierIsBeingReorderd.state = false;

      final categories = ref.watch(categoriesProvider);
      final notifireCategories = ref.read(categoriesProvider.notifier);
      notifireCategories.state = categories;
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.cancel),
    );
  }
}
