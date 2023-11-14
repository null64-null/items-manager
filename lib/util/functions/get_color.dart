import 'package:flutter/material.dart';

Color getColor(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return const Color(0xFF54D6FF);
    case "shoppingPlace":
      return const Color(0xFF62FF54);
    default:
      return Colors.white;
  }
}

Color getDarkColor(String categoryType) {
  switch (categoryType) {
    case "hikidashi":
      return Colors.blue;
    case "shoppingPlace":
      return Colors.green;
    default:
      return Colors.white;
  }
}
