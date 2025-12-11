part of '../widgets.dart';

Future<String?> datePicker(BuildContext context) {
  final _pickedDate = showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
  return _pickedDate.then(
    (value) => value != null ? DateFormat('yyyy-MM-dd').format(value) : 'null',
  );
}
