import 'package:flutter/material.dart';

@immutable
class ScheduleColors extends ThemeExtension<ScheduleColors> {
  final Color schedulePrimary;
  final Color scheduleAccent;

  const ScheduleColors({
    required this.schedulePrimary,
    required this.scheduleAccent,
  });

  static const light = ScheduleColors(
    schedulePrimary: Color(0xFF415F91),
    scheduleAccent: Color(0xFF9DBAF8),
  );

  static const dark = ScheduleColors(
    schedulePrimary: Color(0xFFAAC7FF),
    scheduleAccent: Color(0xFF415F91),
  );

  @override
  ScheduleColors copyWith({Color? schedulePrimary, Color? scheduleAccent}) {
    return ScheduleColors(
      schedulePrimary: schedulePrimary ?? this.schedulePrimary,
      scheduleAccent: scheduleAccent ?? this.scheduleAccent,
    );
  }

  @override
  ThemeExtension<ScheduleColors> lerp(
    ThemeExtension<ScheduleColors>? other,
    double t,
  ) {
    if (other is! ScheduleColors) return this;
    return ScheduleColors(
      schedulePrimary: Color.lerp(schedulePrimary, other.schedulePrimary, t)!,
      scheduleAccent: Color.lerp(scheduleAccent, other.scheduleAccent, t)!,
    );
  }
}
