import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/ui/templates/items_page_template.dart';
import '../../atoms/custom_floating_action_button.dart';
import '../../../util/functions/get_color.dart';

class EndReorderButton extends ConsumerWidget {
  final String categoryType;

  const EndReorderButton({
    Key? key,
    this.categoryType = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPressed() {
      final notifire = ref.read(isBeingReorderdProvider.notifier);
      notifire.state = false;
    }

    return CustomFloatingActionButton(
      color: getDarkColor(categoryType),
      onPressed: onPressed,
      icon: const Icon(Icons.check),
    );
  }
}
