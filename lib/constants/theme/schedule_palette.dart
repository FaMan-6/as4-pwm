import 'package:flutter/material.dart';

class ScheduleColorSet {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color card;
  final Color onCard;

  const ScheduleColorSet({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.card,
    required this.onCard,
  });
}

class SchedulePalette {
  // BLUE
  static const ScheduleColorSet blueLight = ScheduleColorSet(
    primary: Color(0xFF1565C0),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF90CAF9),
    onPrimaryContainer: Color(0xFF0D47A1),
    card: Color(0xFFE3F2FD),
    onCard: Color(0xFF0D47A1),
  );

  static const ScheduleColorSet blueDark = ScheduleColorSet(
    primary: Color(0xFF90CAF9),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF0D47A1),
    onPrimaryContainer: Colors.white,
    card: Color(0xFF1A237E),
    onCard: Colors.white,
  );

  // RED
  static const ScheduleColorSet redLight = ScheduleColorSet(
    primary: Color(0xFFD32F2F),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFEF9A9A),
    onPrimaryContainer: Color(0xFFB71C1C),
    card: Color(0xFFFFEBEE),
    onCard: Color(0xFFB71C1C),
  );

  static const ScheduleColorSet redDark = ScheduleColorSet(
    primary: Color(0xFFEF9A9A),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFFB71C1C),
    onPrimaryContainer: Colors.white,
    card: Color(0xFF880E4F),
    onCard: Colors.white,
  );

  // GREEN
  static const ScheduleColorSet greenLight = ScheduleColorSet(
    primary: Color(0xFF2E7D32),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFA5D6A7),
    onPrimaryContainer: Color(0xFF1B5E20),
    card: Color(0xFFE8F5E9),
    onCard: Color(0xFF1B5E20),
  );

  static const ScheduleColorSet greenDark = ScheduleColorSet(
    primary: Color(0xFFA5D6A7),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF1B5E20),
    onPrimaryContainer: Colors.white,
    card: Color(0xFF004D40),
    onCard: Colors.white,
  );

  // YELLOW
  static const ScheduleColorSet yellowLight = ScheduleColorSet(
    primary: Color(0xFFFBC02D),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFFFFF59D),
    onPrimaryContainer: Color(0xFFF57F17),
    card: Color(0xFFFFFDE7),
    onCard: Color(0xFFF57F17),
  );

  static const ScheduleColorSet yellowDark = ScheduleColorSet(
    primary: Color(0xFFFFF59D),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFFF57F17),
    onPrimaryContainer: Colors.white,
    card: Color(0xFFF9A825),
    onCard: Colors.black,
  );

  // PURPLE
  static const ScheduleColorSet purpleLight = ScheduleColorSet(
    primary: Color(0xFF7B1FA2),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFE1BEE7),
    onPrimaryContainer: Color(0xFF4A148C),
    card: Color(0xFFF3E5F5),
    onCard: Color(0xFF4A148C),
  );

  static const ScheduleColorSet purpleDark = ScheduleColorSet(
    primary: Color(0xFFE1BEE7),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF4A148C),
    onPrimaryContainer: Colors.white,
    card: Color(0xFF311B92),
    onCard: Colors.white,
  );

  // ORANGE
  static const ScheduleColorSet orangeLight = ScheduleColorSet(
    primary: Color(0xFFF57C00),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFFFCC80),
    onPrimaryContainer: Color(0xFFE65100),
    card: Color(0xFFFFF3E0),
    onCard: Color(0xFFE65100),
  );

  static const ScheduleColorSet orangeDark = ScheduleColorSet(
    primary: Color(0xFFFFB74D),
    onPrimary: Colors.black,
    primaryContainer: Color(0xFFE65100),
    onPrimaryContainer: Colors.white,
    card: Color(0xFFBF360C),
    onCard: Colors.white,
  );
}

class ScheduleColorMapper {
  static ScheduleColorSet fromName(String name, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (name.toLowerCase()) {
      case "blue":
        return isDark ? SchedulePalette.blueDark : SchedulePalette.blueLight;
      case "red":
        return isDark ? SchedulePalette.redDark : SchedulePalette.redLight;
      case "green":
        return isDark ? SchedulePalette.greenDark : SchedulePalette.greenLight;
      case "yellow":
        return isDark
            ? SchedulePalette.yellowDark
            : SchedulePalette.yellowLight;
      case "purple":
        return isDark
            ? SchedulePalette.purpleDark
            : SchedulePalette.purpleLight;
      case "orange":
        return isDark
            ? SchedulePalette.orangeDark
            : SchedulePalette.orangeLight;
      default:
        return isDark ? SchedulePalette.blueDark : SchedulePalette.blueLight;
    }
  }
}

class ScheduleColorOptions {
  static const List<String> names = [
    "blue",
    "red",
    "green",
    "yellow",
    "purple",
    "orange",
  ];
}

class ScheduleColorPreview {
  static Color getColor(String name, BuildContext context) {
    return ScheduleColorMapper.fromName(name, context).primary;
  }
}
