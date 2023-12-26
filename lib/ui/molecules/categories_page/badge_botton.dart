import 'package:flutter/material.dart';
import '../../atoms/categories_page/box_button.dart';
import '../../atoms/categories_page/notification_badge.dart';

class BadgeButton extends StatelessWidget {
  final String label;
  final Color color;
  final int notifications;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final bool disabled;

  const BadgeButton({
    Key? key,
    this.label = 'label',
    this.color = Colors.white,
    this.notifications = 0,
    this.onPressed,
    this.onLongPressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 100,
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: BoxButton(
              onPressed: onPressed,
              onLongPressed: onLongPressed,
              color: color,
              label: label,
              disabled: disabled,
            ),
          ),
          if (notifications != 0)
            Align(
              alignment: const Alignment(0.8, -0.8),
              child: NotificationBadge(notifications: notifications),
            ),
        ],
      ),
    );
  }
}
