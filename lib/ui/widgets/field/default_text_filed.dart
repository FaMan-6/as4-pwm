part of '../widgets.dart';

class DefaultTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;

  const DefaultTextFiled({
    super.key,
    required this.hint,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hint,
        labelText: label,
      ),
    );
  }
}
