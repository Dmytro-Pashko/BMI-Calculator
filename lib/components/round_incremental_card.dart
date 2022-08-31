import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';

import 'rounded_card.dart';

const primaryColor = Colors.white;
const secondaryColor = Color(0xFF8E8E99);
const Color backgroundColor = Color(0xFF111428);

class RoundIncrementalCard extends StatelessWidget {
  const RoundIncrementalCard({
    Key? key,
    required this.label,
    required this.currentValue,
    required this.incrementButtonIcon,
    required this.decrementButtonIcon,
    required this.onDecremented,
    required this.onIncremented,
  }) : super(key: key);

  final String label;
  final int currentValue;
  final IconData incrementButtonIcon;
  final IconData decrementButtonIcon;
  final Function() onDecremented;
  final Function() onIncremented;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 15,
            ),
          ),
          Text(
            '$currentValue',
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundIconButton(
                  iconData: decrementButtonIcon,
                  onPress: () {
                    onDecremented();
                  }),
              RoundIconButton(
                iconData: incrementButtonIcon,
                onPress: () {
                  onIncremented();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
