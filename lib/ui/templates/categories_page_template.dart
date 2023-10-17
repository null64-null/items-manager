import 'package:flutter/material.dart';
import './../atoms/box_botton.dart';
import './../organisms/footer/categories_page_footer.dart';
import '../../util/classes/category.dart';

const List<Category> initialCategorys = [
  Category(id: 0, name: "name", notifications: 0),
];

class CategoriesPageTemplate extends StatelessWidget {
  final String pageTitle;
  final String categoryType;
  final List<Category> buttonItems;
  final Color appBarColor;
  final Color boxButtonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.pageTitle = 'title',
    this.categoryType = "",
    this.buttonItems = initialCategorys,
    this.appBarColor = Colors.white,
    this.boxButtonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: [
              for (final buttonItem in buttonItems)
                BoxButton(
                  label: buttonItem.name,
                  color: boxButtonColor,
                  notifications: buttonItem.notifications ?? 0,
                  onPressed: () {
                    buttonItem.onPressed(context, categoryType);
                  },
                ),
            ],
          )
        ],
      ),
      bottomNavigationBar: CategoryPageFooter(
        color: getColor(categoryType),
        categoryType: categoryType,
        itemsLength: buttonItems.length,
      ),
    );
  }

  Color getColor(categoryType) {
    switch (categoryType) {
      case "hikidashi":
        return const Color(0xFF54D6FF);
      case "shoppingPlace":
        return const Color(0xFF62FF54);
      default:
        return Colors.white;
    }
  }
}


/*
const List<Category> initialCategorys = [
  Category(id: 0, name: "name", notifications: 0),
];

class CategoriesPageTemplate extends StatelessWidget {
  final String pageTitle;
  final String categoryType;
  final List<Category>? buttonItems;
  final Color appBarColor;
  final Color boxButtonColor;

  const CategoriesPageTemplate({
    Key? key,
    this.pageTitle = 'title',
    this.categoryType = "",
    this.buttonItems,
    this.appBarColor = Colors.white,
    this.boxButtonColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: buttonItems,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // データがまだ利用できない場合
          return Scaffold(
            appBar: AppBar(
              title: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: appBarColor,
            ),
            body: const Text("now loading ..."),
          );
        } else if (snapshot.hasError) {
          // エラーが発生した場合
          return Scaffold(
            appBar: AppBar(
              title: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: appBarColor,
            ),
            body: const Text("loading failed"),
          );
        } else if (snapshot.hasData) {
          // データが利用可能な場合
          List<Category> buttonItems = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: appBarColor,
            ),
            body: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverGrid.count(
                  crossAxisCount: 2,
                  children: [
                    for (final buttonItem in buttonItems)
                      BoxButton(
                        label: buttonItem.name,
                        color: boxButtonColor,
                        notifications: buttonItem.notifications ?? 0,
                        onPressed: () {
                          buttonItem.onPressed(context, categoryType);
                        },
                      ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: CategoryPageFooter(
              color: getColor(categoryType),
              categoryType: categoryType,
              itemsLength: buttonItems.length,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: appBarColor,
            ),
            body: const Text("no date"),
          );
        }
      },
    );
  }

  Color getColor(categoryType) {
    switch (categoryType) {
      case "hikidashi":
        return const Color(0xFF54D6FF);
      case "shoppingPlace":
        return const Color(0xFF62FF54);
      default:
        return Colors.white;
    }
  }
}
*/