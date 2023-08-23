import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BoxButton extends StatelessWidget {
  final String label;
  final Color color;
  final int notifications;
  final VoidCallback? onPressed;

  const BoxButton({
    Key? key,
    this.label = 'label',
    this.color = Colors.white,
    this.notifications = 0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        notifications.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      showBadge: notifications != 0,
      position: badges.BadgePosition.topEnd(top: -25, end: -20),
      badgeStyle: const badges.BadgeStyle(
        padding: EdgeInsets.all(13),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          fixedSize: const Size(146, 130),
          backgroundColor: color,
          shadowColor: const Color(0x3F000000),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
