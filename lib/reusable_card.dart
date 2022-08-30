import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  RoundedCard({Key? key, required this.child, required this.color})
      : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: child,
    );
  }
}
