import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int notifications;

  const NotificationBadge({
    Key? key,
    this.notifications = 0,
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
        notifications < 100 ? notifications.toString() : "+99",
        maxLines: 1,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
