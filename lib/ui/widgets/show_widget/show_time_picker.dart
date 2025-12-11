part of '../widgets.dart';

Future<String?> timePicker(BuildContext context) {
  final _pickedTime = showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.dial,
  );
  return _pickedTime.then((value) {
    final hour = value!.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');

    return '$hour:$minute:00';
  });
}
