import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({Key? key, required this.color, required this.child})
      : super(key: key);

  final Color color;
  final Widget child;

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