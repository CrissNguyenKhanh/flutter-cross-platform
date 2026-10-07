import 'package:flutter_test/flutter_test.dart';
import 'package:lab02_micard/main.dart';

void main() {
  testWidgets('MiCard displays student information', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MiCard'), findsOneWidget);
    expect(find.text('Nguyễn Quốc khánh'), findsOneWidget);
    expect(find.text('23IT126'), findsOneWidget);
    expect(find.text('Flutter & Dart'), findsOneWidget);
  });
}
