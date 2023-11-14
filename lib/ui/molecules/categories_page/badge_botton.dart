import 'package:flutter/material.dart';
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
          child: SizedBox(
            height: 130,
            width: 130,
            child: ElevatedButton(
              onPressed: onPressed,
              onLongPress: onLongPressed,
              style: buttonStyle(color),
              child: buttonText(label),
            ),
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

const TextStyle buttonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

Text buttonText(String label) {
  return Text(
    label,
    style: buttonTextStyle,
    maxLines: 4,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
  );
}

ButtonStyle buttonStyle(Color color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(color),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
