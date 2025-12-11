part of '../widgets.dart';

class DefaultDatePicker extends StatelessWidget {
  final TextEditingController controller;

  const DefaultDatePicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Select a date',
        labelText: 'Date',
        prefixIcon: Icon(Icons.calendar_month),
      ),
      readOnly: true,
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      onTap: () async {
        await datePicker(context).then((value) => controller.text = value!);
      },
    );
  }
}
