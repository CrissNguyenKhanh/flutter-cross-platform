import 'package:flutter_test/flutter_test.dart';
import 'package:lab03_dice/main.dart';

void main() {
  testWidgets('Dice app displays main interface', (tester) async {
    await tester.pumpWidget(const DiceApp());

    expect(find.text('Dice'), findsOneWidget);
    expect(find.text('Tap a dice or roll both!'), findsOneWidget);
    expect(find.text('ROLL DICE'), findsOneWidget);
  });
}
