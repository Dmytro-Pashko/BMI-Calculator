import 'package:flutter/material.dart';

const Color iconColor = Color(0xFFBBBCC1);
const Color backgroundColor = Color(0xFF1C1F32);

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.onPress,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        elevation: 5,
        fillColor: backgroundColor,
        shape: const CircleBorder(),
        onPressed: onPress,
        child: Icon(
          iconData,
          color: iconColor,
        ));
  }
}
