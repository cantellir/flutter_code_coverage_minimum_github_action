import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_page/second_page.dart';

void main() {
  Future<void> createSecondPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondPage');
                },
                child: const Text('Go to second page'),
              ),
          '/secondPage': (context) => const SecondPage(),
        },
      ),
    );

    await tester.tap(find.text('Go to second page'));
    await tester.pumpAndSettle();
  }

  testWidgets('Should create SecondPage correctly',
      (WidgetTester tester) async {
    await createSecondPage(tester);

    expect(find.text('This is the second page!'), findsOneWidget);
  });

  testWidgets('Should go back to first page when go back is pressed',
      (WidgetTester tester) async {
    await createSecondPage(tester);

    await tester.tap(find.text('Go back to first page'));
    await tester.pumpAndSettle();

    expect(find.text('Go to second page'), findsOneWidget);
  });
}
