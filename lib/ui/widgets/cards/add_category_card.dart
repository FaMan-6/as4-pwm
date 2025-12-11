import 'package:flutter/material.dart';

class AddCategoryCard extends StatelessWidget {
  final Function() onTap;
  const AddCategoryCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
            size: 35,
          ),
        ),
      ),
    );
  }
}
