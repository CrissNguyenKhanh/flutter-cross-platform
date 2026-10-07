import 'package:flutter_test/flutter_test.dart';
import 'package:lab06_quizzler/main.dart';

void main() {
  testWidgets('Quizzler displays quiz interface', (tester) async {
    await tester.pumpWidget(const QuizzlerApp());

    expect(find.text('Quizzler'), findsOneWidget);
    expect(find.text('Question 1 / 10'), findsOneWidget);

    expect(find.text('Flutter is developed by Google.'), findsOneWidget);

    expect(find.text('TRUE'), findsOneWidget);
    expect(find.text('FALSE'), findsOneWidget);
  });

  testWidgets('Answering question moves to next question', (tester) async {
    await tester.pumpWidget(const QuizzlerApp());

    await tester.tap(find.text('TRUE'));
    await tester.pump();

    expect(find.text('Question 2 / 10'), findsOneWidget);

    expect(
      find.text('Dart is a programming language used by Flutter.'),
      findsOneWidget,
    );
  });
}
