import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const LongButton({
    Key? key,
    this.label = 'label',
    this.color = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 81,
      //padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          fixedSize: const Size(320, 81),
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
