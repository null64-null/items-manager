import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dialog/category_add_dialog.dart';

final selectProvider = StateProvider<int>((ref) {
  return 0;
});

class CategoryPageFooter extends ConsumerWidget {
  final Color color;
  final String categoryType;
  final int itemsLength;

  const CategoryPageFooter({
    Key? key,
    this.color = Colors.white,
    this.categoryType = "",
    this.itemsLength = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final select = ref.watch(selectProvider);

    return BottomNavigationBar(
      currentIndex: select,
      onTap: (int index) {
        onButttonTapped(index, ref, context);
      },
      backgroundColor: color,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "追加",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.delete),
          label: "選択削除",
        ),
      ],
    );
  }

  onButttonTapped(int index, WidgetRef ref, context) {
    final notifire = ref.read(selectProvider.notifier);
    notifire.state = index;
    switch (index) {
      case 0:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CategoryAddDialog(
              categoryType: categoryType,
              newCategoryId: itemsLength + 1,
            );
          },
        );
        break;
      case 1:
        debugPrint("1");
        break;
      default:
        debugPrint("none");
        break;
    }
  }
}
