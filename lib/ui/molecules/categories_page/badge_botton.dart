import 'package:flutter/material.dart';
import '../../atoms/categories_page/box_button.dart';
import '../../atoms/categories_page/notification_badge.dart';

class BadgeButton extends StatelessWidget {
  final String label;
  final Color color;
  final int notifications;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  const BadgeButton({
    Key? key,
    this.label = 'label',
    this.color = Colors.white,
    this.notifications = 0,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: const Alignment(0, 0),
          child: BoxButton(
            onPressed: onPressed,
            onLongPressed: onLongPressed,
            color: color,
            label: label,
          ),
        ),
        if (notifications != 0)
          Align(
            alignment: const Alignment(0.8, -0.8),
            child: NotificationBadge(notifications: notifications),
          ),
      ],
    );
  }
}
