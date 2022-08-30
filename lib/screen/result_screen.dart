import 'package:bmi_calculator/bottom_navigable_button.dart';
import 'package:bmi_calculator/rounded_card.dart';
import 'package:flutter/material.dart';

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  final double result = 26.5;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'NORMAL',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$result',
                          style: TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('You have normal body weight. Good Job.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    color: Color(0xFF1D1F33))),
            NavigableButton(
                label: 'RE-CALCULATE YOUR BMI',
                onClick: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
