import 'package:flutter_test/flutter_test.dart';
import 'package:lab08_bmi_calculator/calculator_brain.dart';

void main() {
  test('BMI is calculated correctly', () {
    const calculator = CalculatorBrain(height: 170, weight: 65);

    expect(calculator.calculateBMI(), closeTo(22.49, 0.01));

    expect(calculator.getResult(), 'NORMAL');
  });
}
