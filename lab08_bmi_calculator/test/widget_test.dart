import 'package:flutter_test/flutter_test.dart';
import 'package:lab08_bmi_calculator/main.dart';

void main() {
  testWidgets('BMI calculator displays input controls', (tester) async {
    await tester.pumpWidget(const BmiApp());

    expect(find.text('BMI CALCULATOR'), findsOneWidget);
    expect(find.text('MALE'), findsOneWidget);
    expect(find.text('FEMALE'), findsOneWidget);
    expect(find.text('HEIGHT'), findsOneWidget);
    expect(find.text('WEIGHT'), findsOneWidget);
    expect(find.text('AGE'), findsOneWidget);
    expect(find.text('CALCULATE'), findsOneWidget);
  });

  testWidgets('Calculate button opens result page', (tester) async {
    await tester.pumpWidget(const BmiApp());

    await tester.tap(find.text('CALCULATE'));
    await tester.pumpAndSettle();

    expect(find.text('BMI RESULT'), findsOneWidget);
    expect(find.text('Your Result'), findsOneWidget);
    expect(find.text('RE-CALCULATE'), findsOneWidget);
  });
}
