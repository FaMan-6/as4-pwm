part of '../widgets.dart';

class CategoryPicker extends StatelessWidget {
  final ScheduleController controller;
  const CategoryPicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.categoryController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Select a category',
        labelText: 'Category',
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
      readOnly: true,
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      onTap: () async {
        final value = await showCategoryPicker(context);
        if (value == null || value.isEmpty) {
          print(value);
          print('value is null');
        } else {
          controller.categoryController.text = value['name'];
          controller.selectedCategoryId = value['id'];
          print(value['message']);
        }
      },
    );
  }
}
