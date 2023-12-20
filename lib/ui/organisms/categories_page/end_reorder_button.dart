import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../templates/categories_page_template.dart';
import '../../../../util/functions/get_color.dart';
import '../../../../util/classes/category.dart';
import '../../../../util/values/initial_values.dart';
import '../../../db/basic_crud.dart';

class EndReorderButton extends ConsumerWidget {
  final String categoryType;
  final List<Category> categories;

  const EndReorderButton({
    Key? key,
    this.categoryType = "",
    this.categories = categoriesInit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onPressed() async {
      if (categoryType == "hikidashi") {
        try {
          await deleteAllHikidashi();
          await insertHikidashis(categories);
        } catch (e) {
          debugPrint('Error: $e');
        }
      }
      if (categoryType == "shoppingPlace") {
        try {
          await deleteAllHikidashi();
          await insertHikidashis(categories);
        } catch (e) {
          debugPrint('Error: $e');
        }
      }

      final notifier = ref.read(isBeingReorderdProvider.notifier);
      notifier.state = false;
    }

    debugPrint(categories[0].id.toString());
    debugPrint(categories[0].name.toString());
    debugPrint(categories[1].id.toString());
    debugPrint(categories[1].name.toString());

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.check),
    );
  }
}
