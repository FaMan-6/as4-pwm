// schedule_theme.dart (Single File)
import 'package:flutter/material.dart';

class ScheduleColors extends ThemeExtension<ScheduleColors> {
  // BLUE
  final Color scheduleBluePrimary;
  final Color scheduleBlueOnPrimary;
  final Color scheduleBluePrimaryContainer;
  final Color scheduleBlueOnPrimaryContainer;
  final Color scheduleBlueCard;
  final Color scheduleBlueOnCard;

  // RED
  final Color scheduleRedPrimary;
  final Color scheduleRedOnPrimary;
  final Color scheduleRedPrimaryContainer;
  final Color scheduleRedOnPrimaryContainer;
  final Color scheduleRedCard;
  final Color scheduleRedOnCard;

  // GREEN
  final Color scheduleGreenPrimary;
  final Color scheduleGreenOnPrimary;
  final Color scheduleGreenPrimaryContainer;
  final Color scheduleGreenOnPrimaryContainer;
  final Color scheduleGreenCard;
  final Color scheduleGreenOnCard;

  // YELLOW
  final Color scheduleYellowPrimary;
  final Color scheduleYellowOnPrimary;
  final Color scheduleYellowPrimaryContainer;
  final Color scheduleYellowOnPrimaryContainer;
  final Color scheduleYellowCard;
  final Color scheduleYellowOnCard;

  // PURPLE
  final Color schedulePurplePrimary;
  final Color schedulePurpleOnPrimary;
  final Color schedulePurplePrimaryContainer;
  final Color schedulePurpleOnPrimaryContainer;
  final Color schedulePurpleCard;
  final Color schedulePurpleOnCard;

  // ORANGE
  final Color scheduleOrangePrimary;
  final Color scheduleOrangeOnPrimary;
  final Color scheduleOrangePrimaryContainer;
  final Color scheduleOrangeOnPrimaryContainer;
  final Color scheduleOrangeCard;
  final Color scheduleOrangeOnCard;

  const ScheduleColors({
    // BLUE
    required this.scheduleBluePrimary,
    required this.scheduleBlueOnPrimary,
    required this.scheduleBluePrimaryContainer,
    required this.scheduleBlueOnPrimaryContainer,
    required this.scheduleBlueCard,
    required this.scheduleBlueOnCard,
    // RED
    required this.scheduleRedPrimary,
    required this.scheduleRedOnPrimary,
    required this.scheduleRedPrimaryContainer,
    required this.scheduleRedOnPrimaryContainer,
    required this.scheduleRedCard,
    required this.scheduleRedOnCard,
    // GREEN
    required this.scheduleGreenPrimary,
    required this.scheduleGreenOnPrimary,
    required this.scheduleGreenPrimaryContainer,
    required this.scheduleGreenOnPrimaryContainer,
    required this.scheduleGreenCard,
    required this.scheduleGreenOnCard,
    // YELLOW
    required this.scheduleYellowPrimary,
    required this.scheduleYellowOnPrimary,
    required this.scheduleYellowPrimaryContainer,
    required this.scheduleYellowOnPrimaryContainer,
    required this.scheduleYellowCard,
    required this.scheduleYellowOnCard,
    // PURPLE
    required this.schedulePurplePrimary,
    required this.schedulePurpleOnPrimary,
    required this.schedulePurplePrimaryContainer,
    required this.schedulePurpleOnPrimaryContainer,
    required this.schedulePurpleCard,
    required this.schedulePurpleOnCard,
    // ORANGE
    required this.scheduleOrangePrimary,
    required this.scheduleOrangeOnPrimary,
    required this.scheduleOrangePrimaryContainer,
    required this.scheduleOrangeOnPrimaryContainer,
    required this.scheduleOrangeCard,
    required this.scheduleOrangeOnCard,
  });

  // LIGHT THEME VALUES
  static const light = ScheduleColors(
    // BLUE
    scheduleBluePrimary: Color(0xFF1565C0),
    scheduleBlueOnPrimary: Colors.white,
    scheduleBluePrimaryContainer: Color(0xFF90CAF9),
    scheduleBlueOnPrimaryContainer: Color(0xFF0D47A1),
    scheduleBlueCard: Color(0xFFE3F2FD),
    scheduleBlueOnCard: Color(0xFF002F6C),

    // RED
    scheduleRedPrimary: Color(0xFFD32F2F),
    scheduleRedOnPrimary: Colors.white,
    scheduleRedPrimaryContainer: Color(0xFFEF9A9A),
    scheduleRedOnPrimaryContainer: Color(0xFFB71C1C),
    scheduleRedCard: Color(0xFFFFEBEE),
    scheduleRedOnCard: Color(0xFF7F0000),

    // GREEN
    scheduleGreenPrimary: Color(0xFF2E7D32),
    scheduleGreenOnPrimary: Colors.white,
    scheduleGreenPrimaryContainer: Color(0xFFA5D6A7),
    scheduleGreenOnPrimaryContainer: Color(0xFF1B5E20),
    scheduleGreenCard: Color(0xFFE8F5E9),
    scheduleGreenOnCard: Color(0xFF003300),

    // YELLOW
    scheduleYellowPrimary: Color(0xFFF9A825),
    scheduleYellowOnPrimary: Colors.black,
    scheduleYellowPrimaryContainer: Color(0xFFFFF59D),
    scheduleYellowOnPrimaryContainer: Color(0xFFF57F17),
    scheduleYellowCard: Color(0xFFFFFDE7),
    scheduleYellowOnCard: Color(0xFF3E2723),

    // PURPLE
    schedulePurplePrimary: Color(0xFF7B1FA2),
    schedulePurpleOnPrimary: Colors.white,
    schedulePurplePrimaryContainer: Color(0xFFCE93D8),
    schedulePurpleOnPrimaryContainer: Color(0xFF4A0072),
    schedulePurpleCard: Color(0xFFF3E5F5),
    schedulePurpleOnCard: Color(0xFF311B92),

    // ORANGE
    scheduleOrangePrimary: Color(0xFFF57C00),
    scheduleOrangeOnPrimary: Colors.white,
    scheduleOrangePrimaryContainer: Color(0xFFFFCC80),
    scheduleOrangeOnPrimaryContainer: Color(0xFFE65100),
    scheduleOrangeCard: Color(0xFFFFF3E0),
    scheduleOrangeOnCard: Color(0xFF4E2600),
  );

  // DARK THEME VALUES
  static const dark = ScheduleColors(
    // BLUE
    scheduleBluePrimary: Color(0xFF90CAF9),
    scheduleBlueOnPrimary: Color(0xFF003C8F),
    scheduleBluePrimaryContainer: Color(0xFF0D47A1),
    scheduleBlueOnPrimaryContainer: Colors.white,
    scheduleBlueCard: Color(0xFF0A1929),
    scheduleBlueOnCard: Color(0xFF82B1FF),

    // RED
    scheduleRedPrimary: Color(0xFFEF9A9A),
    scheduleRedOnPrimary: Color(0xFF7F0000),
    scheduleRedPrimaryContainer: Color(0xFFB71C1C),
    scheduleRedOnPrimaryContainer: Colors.white,
    scheduleRedCard: Color(0xFF2B0000),
    scheduleRedOnCard: Color(0xFFFFB3B3),

    // GREEN
    scheduleGreenPrimary: Color(0xFFA5D6A7),
    scheduleGreenOnPrimary: Color(0xFF003300),
    scheduleGreenPrimaryContainer: Color(0xFF1B5E20),
    scheduleGreenOnPrimaryContainer: Colors.white,
    scheduleGreenCard: Color(0xFF0A1F0A),
    scheduleGreenOnCard: Color(0xFFB9FFB9),

    // YELLOW
    scheduleYellowPrimary: Color(0xFFFFF59D),
    scheduleYellowOnPrimary: Color(0xFF3E2723),
    scheduleYellowPrimaryContainer: Color(0xFFF57F17),
    scheduleYellowOnPrimaryContainer: Colors.white,
    scheduleYellowCard: Color(0xFF2B2100),
    scheduleYellowOnCard: Color(0xFFFFE082),

    // PURPLE
    schedulePurplePrimary: Color(0xFFCE93D8),
    schedulePurpleOnPrimary: Color(0xFF311B92),
    schedulePurplePrimaryContainer: Color(0xFF4A0072),
    schedulePurpleOnPrimaryContainer: Colors.white,
    schedulePurpleCard: Color(0xFF1A0F1F),
    schedulePurpleOnCard: Color(0xFFE1BEE7),

    // ORANGE
    scheduleOrangePrimary: Color(0xFFFFCC80),
    scheduleOrangeOnPrimary: Color(0xFF4E2600),
    scheduleOrangePrimaryContainer: Color(0xFFE65100),
    scheduleOrangeOnPrimaryContainer: Colors.white,
    scheduleOrangeCard: Color(0xFF2A1200),
    scheduleOrangeOnCard: Color(0xFFFFB074),
  );

  @override
  ScheduleColors copyWith() => this;

  @override
  ScheduleColors lerp(other, t) => this;
}
