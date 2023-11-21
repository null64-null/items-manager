import 'package:flutter/material.dart';
import '../atoms/app_bar.dart';

class LoadingErrorPage extends StatelessWidget {
  final String errorMessage;
  final String title;
  final Color appBarColor;

  const LoadingErrorPage({
    Key? key,
    this.errorMessage = "",
    this.title = "",
    this.appBarColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        color: appBarColor,
      ),
      body: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
