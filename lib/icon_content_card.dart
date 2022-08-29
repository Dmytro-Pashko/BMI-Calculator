
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

const activeCardIconColor = Color(0xFF8D8E98);
const activeCardTextColor = Color(0xFF8D8E98);
const activeCardColor = Color(0xFF1D1F33);

class IconContentCard extends StatelessWidget {
  const IconContentCard({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: activeCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: activeCardIconColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            label,
            style: const TextStyle(color: activeCardTextColor, fontSize: 20),
          )
        ],
      ),
    );
  }
}