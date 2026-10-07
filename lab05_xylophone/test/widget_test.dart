import 'package:flutter_test/flutter_test.dart';
import 'package:lab05_xylophone/main.dart';

void main() {
  testWidgets('Xylophone displays seven musical notes', (tester) async {
    await tester.pumpWidget(const XylophoneApp());

    expect(find.text('Xylophone'), findsOneWidget);
    expect(find.text('DO'), findsOneWidget);
    expect(find.text('RE'), findsOneWidget);
    expect(find.text('MI'), findsOneWidget);
    expect(find.text('FA'), findsOneWidget);
    expect(find.text('SOL'), findsOneWidget);
    expect(find.text('LA'), findsOneWidget);
    expect(find.text('SI'), findsOneWidget);
  });
}
