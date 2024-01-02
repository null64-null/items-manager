import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/templates/items_page_template.dart';
import 'package:test_app/ui/pages/items_page.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../../util/functions/get_color.dart';

class CancelReorderButton extends ConsumerWidget {
  final String categoryType;
  final int? categoryId;

  const CancelReorderButton({
    Key? key,
    this.categoryType = "",
    this.categoryId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() async {
      final notifire = ref.read(isBeingReorderdProvider.notifier);
      notifire.state = false;

      await fetchData(
        categoryType: categoryType,
        categoryId: categoryId,
        ref: ref,
      );
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.cancel),
    );
  }
}
