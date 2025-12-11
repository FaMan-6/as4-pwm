import 'package:flutter/material.dart';

class SpacerHeight extends StatelessWidget {
  final double height;
  const SpacerHeight({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class SpacerWidth extends StatelessWidget {
  final double width;
  const SpacerWidth({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
