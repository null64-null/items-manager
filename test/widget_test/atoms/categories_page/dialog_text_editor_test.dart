import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/ui/atoms/categories_page/dialog_text_editor.dart';

void main() {
  testWidgets('DialogTextEditor widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DialogTextEditor(
            formLabel: 'Test Label',
            initialValue: 'Initial Value',
            onChanged: (value) {},
          ),
        ),
      ),
    );

    expect(find.text('Test Label'), findsOneWidget);

    expect(find.text('Initial Value'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'New Value');
    expect(find.text('New Value'), findsOneWidget);
  });
}
