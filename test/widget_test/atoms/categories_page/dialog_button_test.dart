import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/ui/atoms/categories_page/dialog_button.dart';

void main() {
  // ボタン名が表示されていることを確認する
  testWidgets('DialogButton displays correct label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogButton(
            buttonLabel: 'Test Button',
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
  });

  // isActive未定義時にボタンがアクティブであることを確認する
  testWidgets('DialogButton is active by default', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogButton(),
        ),
      ),
    );

    expect(
      (tester.widget(find.byType(Text)) as Text).style!.color,
      equals(Colors.black),
    );
  });

  // isActive=false時にボタンが非アクティブであることを確認する
  testWidgets('DialogButton is inactive when isActive is false',
      (WidgetTester tester) async {
    // DialogButtonを非アクティブ状態で構築する
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DialogButton(
            isActive: false,
          ),
        ),
      ),
    );

    expect(
      (tester.widget(find.byType(Text)) as Text).style!.color,
      equals(Colors.black26),
    );
  });
}
