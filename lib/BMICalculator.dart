import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;

  BMICalculator(this.height, this.weight);

  double getValue() {
    return weight / pow(height / 100, 2);
  }

  BMIResult getResult() {
    var bmi = getValue();
    if (bmi >= 25) {
      return BMIResult.overweight;
    } else if (bmi > 18.5) {
      return BMIResult.normal;
    } else {
      return BMIResult.underweight;
    }
  }

  String getInterpretation() {
    var bmi = getValue();
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

enum BMIResult {
  underweight,
  normal,
  overweight;
}
