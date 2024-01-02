import 'package:flutter/material.dart';
import '../../atoms/categories_page/notification_badge.dart';

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

const TextStyle buttonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20,
);

class BadgeBoxButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final Color color;
  final String label;
  final int badgeValue;
  final bool disabled;

  const BadgeBoxButton({
    Key? key,
    this.onPressed,
    this.onLongPressed,
    this.color = Colors.white,
    this.label = "",
    this.badgeValue = 0,
    this.disabled = false,
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
              onPressed: disabled ? () {} : onPressed,
              onLongPress: disabled ? () {} : onLongPressed,
              style: buttonStyle(color),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(0, 0),
                    child: buttonText(label),
                  ),
                  if (badgeValue != 0)
                    Align(
                      alignment: const Alignment(2.2, -1.4),
                      child: NotificationBadge(badgeValue: badgeValue),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
