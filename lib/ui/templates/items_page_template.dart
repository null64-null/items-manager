import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../atoms/app_bar.dart';
import '../organisms/items_page/item_status_button.dart';
import '../organisms/items_page/add_item_button.dart';
import '../organisms/items_page/start_reorder_button.dart';
import '../organisms/items_page/end_reorder_button.dart';
import '../organisms/items_page/cancel_reorder_button.dart';
import '../../util/classes/items.dart';
import '../../util/functions/get_color.dart';

final isBeingReorderdProvider = StateProvider<bool>((ref) {
  return false;
});

class ItemsPageTemplate extends ConsumerWidget {
  final String pageTitle;
  final String categoryType;
  final int? categoryId;
  final List<Item>? items;

  const ItemsPageTemplate({
    Key? key,
    this.pageTitle = "",
    this.categoryType = "",
    this.categoryId,
    this.items,
  }) : super(key: key);

  void reorder(List<Item>? items, int oldIndex, int newIndex) {
    if (items != null) {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBeingReorderd = ref.watch(isBeingReorderdProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: pageTitle,
        color: getColor(categoryType),
      ),
      body: isBeingReorderd
          ? CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverReorderableList(
                  onReorder: (int oldIndex, int newIndex) {
                    reorder(items, oldIndex, newIndex);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      key: ValueKey('$index'),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: ReorderableDragStartListener(
                          index: index,
                          child: ItemStatusButton(
                            item: items![index],
                            categoryType: categoryType,
                            categoryId: categoryId,
                            disabled: isBeingReorderd,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: items!.length,
                ),
              ],
            )
          : CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        key: ValueKey('$index'),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: ItemStatusButton(
                            item: items![index],
                            categoryType: categoryType,
                            categoryId: categoryId,
                            disabled: isBeingReorderd,
                          ),
                        ),
                      );
                    },
                    childCount: items!.length,
                  ),
                ),
              ],
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: isBeingReorderd
            ? [
                const SizedBox(
                  width: 35,
                ),
                EndReorderButton(
                  categoryType: categoryType,
                ),
                const SizedBox(
                  width: 15,
                ),
                CancelReorderButton(
                  categoryType: categoryType,
                  categoryId: categoryId,
                )
              ]
            : [
                const SizedBox(
                  width: 35,
                ),
                AddItemButton(
                  categoryType: categoryType,
                  categoryId: categoryId,
                ),
                const SizedBox(
                  width: 15,
                ),
                StartReorderButton(
                  categoryType: categoryType,
                ),
              ],
      ),
    );
  }
}
