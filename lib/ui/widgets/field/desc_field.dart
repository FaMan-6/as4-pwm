part of '../widgets.dart';

class DescField extends StatelessWidget {
  final TextEditingController controller;
  const DescField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Enter your description',
      ),
      maxLines: 7,
    );
  }
}
