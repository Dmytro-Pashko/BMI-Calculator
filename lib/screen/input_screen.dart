import 'package:bmi_calculator/bottom_navigable_button.dart';
import 'package:bmi_calculator/round_incremental_card.dart';
import 'package:bmi_calculator/round_slider_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../icon_content_card.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

const minHeight = 120;
const maxHeight = 220;
const bottomContainerColor = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 70;
  int age = 20;

  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void onWeightChanged(int newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void onAgeChanged(int newAge) {
    setState(() {
      age = newAge;
    });
  }

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
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: IconContentCard(
                  icon: FontAwesomeIcons.person,
                  label: 'MALE',
                  isSelected: selectedGender == Gender.male,
                  onClick: () {
                    selectGender(Gender.male);
                  },
                )),
                Expanded(
                  child: IconContentCard(
                    icon: FontAwesomeIcons.personDress,
                    label: 'FEMALE',
                    isSelected: selectedGender == Gender.female,
                    onClick: () {
                      selectGender(Gender.female);
                    },
                  ),
                ),
              ],
            )),
            Expanded(
              child: RoundSliderCard(
                currentValue: height,
                minValue: minHeight,
                maxValue: maxHeight,
                units: 'cm',
                label: 'HEIGHT',
                onValueChanged: (newHeight) {
                  setState(() {
                    height = newHeight;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: RoundIncrementalCard(
                      label: 'WEIGHT',
                      currentValue: weight,
                      decrementButtonIcon: FontAwesomeIcons.minus,
                      incrementButtonIcon: FontAwesomeIcons.plus,
                      onDecremented: () {
                        onWeightChanged(weight - 1);
                      },
                      onIncremented: () {
                        onWeightChanged(weight + 1);
                      },
                    ),
                  ),
                  Expanded(
                    child: RoundIncrementalCard(
                      label: 'AGE',
                      currentValue: age,
                      decrementButtonIcon: FontAwesomeIcons.minus,
                      incrementButtonIcon: FontAwesomeIcons.plus,
                      onDecremented: () {
                        onAgeChanged(age - 1);
                      },
                      onIncremented: () {
                        onAgeChanged(age + 1);
                      },
                    ),
                  )
                ],
              ),
            ),
            NavigableButton(
                label: 'CALCULATE YOUR BMI',
                onClick: () {
                  Navigator.pushNamed(context, '/result');
                }),
          ],
        ),
      ),
    );
  }
}

enum Gender { male, female }
