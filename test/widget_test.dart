import 'package:engine_news/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Simple registrar Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: registrar(),
            )));
            await tester.pump();
            expect(find.text('O'), findsOneWidget);
  });

    testWidgets('Simple Title Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: title(),
            )));
            await tester.pump();
            expect(find.text('Engine News'), findsOneWidget);
  });

}
