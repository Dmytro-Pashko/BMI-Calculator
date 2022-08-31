import 'package:bmi_calculator/BMICalculator.dart';
import 'package:flutter/material.dart';

import '../components/bottom_navigable_button.dart';
import '../components/rounded_card.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.result,
    required this.value,
    required this.interpretation,
  }) : super(key: key);

  final BMIResult result;
  final double value;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: const Color(0xFF080A1C),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your result',
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
                child: RoundedCard(
                    color: const Color(0xFF1D1F33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getResultText(result),
                        Text(
                          value.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(interpretation,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ))),
            NavigableButton(
                label: 'RE-CALCULATE YOUR BMI',
                onClick: () {
                  Navigator.pushNamed(context, '/input');
                }),
          ],
        ),
      ),
    );
  }

  Text getResultText(BMIResult result) {
    switch (result) {
      case BMIResult.normal:
        return const Text(
          'NORMAL',
          style: TextStyle(
              fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
        );
      case BMIResult.underweight:
        return const Text(
          'UNDERWEIGHT',
          style: TextStyle(
              fontSize: 20, color: Colors.yellow, fontWeight: FontWeight.bold),
        );
      case BMIResult.overweight:
        return const Text(
          'OVERWEIGHT',
          style: TextStyle(
              fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
        );
    }
  }
}
