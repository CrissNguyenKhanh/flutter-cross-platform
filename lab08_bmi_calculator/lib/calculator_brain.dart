class CalculatorBrain {
  final int height;
  final int weight;

  const CalculatorBrain({required this.height, required this.weight});

  double calculateBMI() {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getResult() {
    final bmi = calculateBMI();

    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    final bmi = calculateBMI();

    if (bmi >= 25) {
      return 'Your BMI is above the normal range. Try to exercise more and maintain a balanced diet.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Great job!';
    } else {
      return 'Your BMI is below the normal range. Consider improving your nutrition.';
    }
  }
}
