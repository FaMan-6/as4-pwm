part of '../widgets.dart';

class DefaultTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const DefaultTimePicker({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Select a time',
          labelText: label,
          prefixIcon: Icon(Icons.access_time),
        ),
        readOnly: true,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
        onTap: () async {
          await timePicker(context).then((value) => controller.text = value!);
        },
      ),
    );
  }
}
