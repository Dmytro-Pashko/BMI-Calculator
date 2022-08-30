import 'package:bmi_calculator/reusable_card.dart';
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
                    child: GestureDetector(
                      onTap: (){
                        selectGender(Gender.MALE);
                      },
                      child: IconContentCard(
                  icon: FontAwesomeIcons.person,
                  label: 'Male',
                  isSelected: selectedGender == Gender.MALE,
                ),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      selectGender(Gender.FEMALE);
                    },
                    child: IconContentCard(
                        icon: FontAwesomeIcons.personDress,
                        label: 'Female',
                        isSelected: selectedGender == Gender.FEMALE),
                  ),
                ),
              ],
            )),
            Expanded(
                child: RoundedCard(
              color: Color(0xFF111428),
              child: Container(),
            )),
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
