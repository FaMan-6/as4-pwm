part of '../widgets.dart';

class ColorPicker extends StatelessWidget {
  final TextEditingController controller;
  const ColorPicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Color _suffixColor = ScheduleColorMapper.fromName(
      controller.text,
      context,
    ).primaryContainer;
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Select a color',
        labelText: 'Color',
        suffix: Icon(Icons.color_lens, color: _suffixColor),
      ),
      onTap: () {
        showColorPicker(context).then((value) => controller.text = value!);
      },
      validator: (value) =>
          value == null || value.isEmpty ? 'Select a color' : null,
    );
  }
}
