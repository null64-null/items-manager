import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/organisms/categories_page/category_edit_dialog.dart';
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
    void onPressed() async {
      final notifier = ref.read(isBeingReorderdProvider.notifier);
      notifier.state = false;

      await fetchData(categoryType, ref);
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.cancel),
    );
  }
}
