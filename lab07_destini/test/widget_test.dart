import 'package:flutter_test/flutter_test.dart';
import 'package:lab07_destini/main.dart';

void main() {
  testWidgets('Destini displays first story and choices', (tester) async {
    await tester.pumpWidget(const DestiniApp());

    expect(find.text('Destini'), findsOneWidget);

    expect(find.text('Enter the dark forest'), findsOneWidget);

    expect(find.text('Walk toward the old house'), findsOneWidget);
  });

  testWidgets('Selecting a choice changes the story', (tester) async {
    await tester.pumpWidget(const DestiniApp());

    await tester.tap(find.text('Enter the dark forest'));

    await tester.pump();

    expect(find.text('Cross the old bridge'), findsOneWidget);

    expect(find.text('Look for another way'), findsOneWidget);
  });
}
