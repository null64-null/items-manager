import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int badgeValue;

  const NotificationBadge({
    Key? key,
    this.badgeValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        badgeValue < 100 ? badgeValue.toString() : "+99",
        maxLines: 1,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
