import 'package:flutter/material.dart';
import '../atoms/app_bar.dart';

class LoadingPage extends StatelessWidget {
  final String title;
  final Color appBarColor;
  final Color indicatorColor;

  const LoadingPage({
    Key? key,
    this.title = "",
    this.appBarColor = Colors.white,
    this.indicatorColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        color: appBarColor,
      ),
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 8.0,
            color: indicatorColor,
          ),
        ),
      ),
    );
  }
}
