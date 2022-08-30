import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

const activeCardIconColor = Color(0xFFFFFFFF);
const inactiveCardIconColor = Color(0xFF8E8E99);

const activeCardColor = Color(0xFF1D1F33);
const inactiveCardColor = Color(0xFF111328);

class IconContentCard extends StatelessWidget {
  const IconContentCard(
      {Key? key,
      required this.icon,
      required this.label,
      required this.isSelected})
      : super(key: key);

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: isSelected ? activeCardIconColor : inactiveCardIconColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            label,
            style: TextStyle(
                color: isSelected ? activeCardIconColor : inactiveCardIconColor,
                fontSize: 20),
          )
        ],
      ),
      color: isSelected ? activeCardColor : inactiveCardColor,
    );
  }
}
