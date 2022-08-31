import 'package:flutter/material.dart';

import 'rounded_card.dart';

const backgroundColor = Color(0xFF111428);
const primaryColor = Colors.white;
const secondaryColor = Color(0xFF8E8E99);
const sliderThumbColor = Color(0xFFEB1555);
const double sliderThumbSize = 15.0;
const double sliderThumbOverlay = 30.0;
const double sliderTrackThickness = 1.0;

class RoundSliderCard extends StatelessWidget {
  const RoundSliderCard({
    Key? key,
    required this.currentValue,
    required this.onValueChanged,
    required this.minValue,
    required this.maxValue,
    required this.label,
    required this.units,
  }) : super(key: key);

  final int currentValue;
  final Function(int) onValueChanged;
  final int minValue;
  final int maxValue;
  final String label;
  final String units;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(color: secondaryColor, fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$currentValue',
                style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 40),
              ),
              Text(
                units,
                style: const TextStyle(color: secondaryColor, fontSize: 20),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: secondaryColor,
              activeTrackColor: primaryColor,
              thumbColor: sliderThumbColor,
              trackHeight: sliderTrackThickness,
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: sliderThumbSize),
              overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: sliderThumbOverlay),
            ),
            child: Slider(
                value: currentValue.toDouble(),
                min: minValue.toDouble(),
                max: maxValue.toDouble(),
                onChanged: (newValue) {
                  onValueChanged(newValue.round());
                }),
          )
        ],
      ),
    );
  }
}
