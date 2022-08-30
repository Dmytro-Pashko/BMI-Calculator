import 'package:bmi_calculator/rounded_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content_card.dart';

void main() => runApp(BMICalculator());

const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(), home: InputPage());
  }
}

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.NONE;
  int height = 180;

  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0D22),
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: Color(0xFF080A1C),
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: IconContentCard(
                  icon: FontAwesomeIcons.person,
                  label: 'Male',
                  isSelected: selectedGender == Gender.MALE,
                  onClick: () {
                    selectGender(Gender.MALE);
                  },
                )),
                Expanded(
                  child: IconContentCard(
                    icon: FontAwesomeIcons.personDress,
                    label: 'Female',
                    isSelected: selectedGender == Gender.FEMALE,
                    onClick: () {
                      selectGender(Gender.FEMALE);
                    },
                  ),
                ),
              ],
            )),
            Expanded(
              child: RoundedCard(
                color: Color(0xFF111428),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(color: Color(0xFF8E8E99), fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 40),
                        ),
                        Text(
                          'cm',
                          style:
                              TextStyle(color: Color(0xFF8E8E99), fontSize: 20),
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8E8E99),
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: RoundedCard(
                    color: Color(0xFF111428),
                    child: Container(),
                  )),
                  Expanded(
                      child: RoundedCard(
                    color: Color(0xFF111428),
                    child: Container(),
                  ))
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}

enum Gender { NONE, MALE, FEMALE }
