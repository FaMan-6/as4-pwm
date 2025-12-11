import 'package:flutter/material.dart';

TimeOfDay parseTime(String time) {
  final cleanedTIme = time.substring(0, 5);
  final parts = cleanedTIme.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

String timeToString(TimeOfDay time) =>
    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

String dateToString(DateTime? date) {
  if (date == null) return '';
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 00:00:00.000';
}

String labelFromDate(DateTime? date) =>
    date == null ? '' : '${date.day}/${date.month}/${date.year}';
