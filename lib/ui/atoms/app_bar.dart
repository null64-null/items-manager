import 'package:flutter/material.dart';

void func() {
  debugPrint("const");
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.color = Colors.white,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          if (onBackPressed != null) {
            onBackPressed!();
          }
          Navigator.pop(context);
        },
      ),
      backgroundColor: color,
    );
  }
}
