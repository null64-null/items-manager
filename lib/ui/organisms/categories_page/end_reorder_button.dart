import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../../../util/functions/get_color.dart';
import '../../templates/categories_page_template.dart';

class EndReorderButton extends ConsumerWidget {
  final String categoryType;

  const EndReorderButton({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifier = ref.read(isBeingReorderdProvider.notifier);
      notifier.state = false;
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.check),
    );
  }
}
