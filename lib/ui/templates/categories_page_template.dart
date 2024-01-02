import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import '../atoms/app_bar.dart';
import '../organisms/categories_page/category_button.dart';
import '../organisms/categories_page/add_category_button.dart';
import '../organisms/categories_page/start_reorder_button.dart';
import '../organisms/categories_page/end_reorder_button.dart';
import '../organisms/categories_page/cancel_reorder_button.dart';
import '../../util/classes/category.dart';
import '../../util/functions/get_color.dart';
import '../../util/values/initial_values.dart';

String title(String categoryType) {
  if (categoryType == "hikidashi") {
    return "ひきだし一覧";
  } else if (categoryType == "shoppingPlace") {
    return "買う場所一覧";
  } else {
    return "";
  }
}

final isBeingReorderdProvider = StateProvider<bool>((ref) {
  return false;
});

class CategoriesPageTemplate extends ConsumerWidget {
  final String categoryType;
  final List<Category> categories;
  final List<int> notificationsArray;
  final Color appBarColor;
  final Color buttonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.categoryType = "",
    this.categories = categoriesInit,
    this.notificationsArray = const [],
    this.appBarColor = Colors.white,
    this.buttonColor = Colors.white,
  }) : super(key: key);

  void reorder(List<Category> categories, int oldIndex, int newIndex) {
    final category = categories.removeAt(oldIndex);
    categories.insert(newIndex, category);

    final notification = notificationsArray.removeAt(oldIndex);
    notificationsArray.insert(newIndex, notification);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBeingReorderd = ref.watch(isBeingReorderdProvider);

    void onBackPressed() {
      final notifire = ref.read(isBeingReorderdProvider.notifier);
      notifire.state = false;
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: title(categoryType),
        color: getColor(categoryType),
        onBackPressed: onBackPressed,
      ),
      body: isBeingReorderd
          ? CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverReorderableGrid(
                  itemBuilder: (_, index) => ReorderableGridDragStartListener(
                    index: index,
                    key: Key('$index'),
                    child: index == categories.length - 1
                        ? Container()
                        : CategoryButton(
                            category: categories[index],
                            categoryType: categoryType,
                            notifications: notificationsArray[index],
                            disabled: true,
                          ),
                  ),
                  itemCount: categories.length - 1,
                  onReorder: (int oldIndex, int newIndex) {
                    reorder(categories, oldIndex, newIndex);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  proxyDecorator: (widget, _, __) {
                    return Opacity(opacity: 0.7, child: widget);
                  },
                ),
              ],
            )
          : CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverGrid.count(
                  crossAxisCount: 2,
                  children: List.generate(categories.length, (index) {
                    final category = categories[index];
                    final notifications = notificationsArray[index];
                    return CategoryButton(
                      category: category,
                      categoryType: categoryType,
                      notifications: notifications,
                      disabled: false,
                    );
                  }),
                )
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
                  categories: categories,
                ),
                const SizedBox(
                  width: 15,
                ),
                CancelReorderButton(
                  categoryType: categoryType,
                ),
              ]
            : [
                const SizedBox(
                  width: 35,
                ),
                AddCategoryButton(
                  categoryType: categoryType,
                  itemsLength: categories.length,
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
