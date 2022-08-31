import 'package:flutter/material.dart';

const buttonColor = Color(0xFFEB1555);
const buttonHeight = 80.0;

class NavigableButton extends StatelessWidget {
  const NavigableButton({
    Key? key,
    required this.label,
    required this.onClick,
  }) : super(key: key);

  final String label;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
          alignment: Alignment.center,
          color: buttonColor,
          width: double.infinity,
          height: buttonHeight,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
