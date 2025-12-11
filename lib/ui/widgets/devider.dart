import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  final double height;
  const Devider({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Container(
        color: Theme.of(context).colorScheme.outline.withAlpha(50),
      ),
    );
  }
}
