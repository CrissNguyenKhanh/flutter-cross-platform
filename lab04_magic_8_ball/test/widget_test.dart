import 'package:flutter_test/flutter_test.dart';
import 'package:lab04_magic_8_ball/main.dart';

void main() {
  testWidgets('Magic 8 Ball displays main interface', (tester) async {
    await tester.pumpWidget(const Magic8BallApp());

    expect(find.text('Magic 8 Ball'), findsOneWidget);
    expect(find.text('Ask me anything!'), findsOneWidget);
    expect(find.text('Tap the ball to get your answer'), findsOneWidget);
  });
}
