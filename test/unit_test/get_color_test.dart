import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/util/functions/get_color.dart';

void main() {
  test('getColor method test', () {
    // "hikidashi" categoryType
    expect(getColor("hikidashi"), equals(const Color(0xFF54D6FF)));

    // "shoppingPlace" categoryType
    expect(getColor("shoppingPlace"), equals(const Color(0xFF62FF54)));

    // default value
    expect(getColor("unknownType"), equals(Colors.white));
  });

  test('getDarkColor method test', () {
    // "hikidashi" categoryType
    expect(getDarkColor("hikidashi"), equals(Colors.blue));

    // "shoppingPlace" categoryType
    expect(getDarkColor("shoppingPlace"), equals(Colors.green));

    // default value
    expect(getDarkColor("unknownType"), equals(Colors.white));
  });
}
