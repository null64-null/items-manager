import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/util/functions/get_title.dart';

void main() {
  test('Returns correct title for "hikidashi" category', () {
    expect(getTitle("hikidashi"), "おうちのひきだし");
    expect(getTitle("shoppingPlace"), "かいものリスト");
    expect(getTitle("unknown"), "");
  });
}
