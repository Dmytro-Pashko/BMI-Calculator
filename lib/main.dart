import 'package:bmi_calculator/screen/input_screen.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/input",
      routes: {
        '/input': (context) => const InputScreen(),
      },
    );
  }
}
