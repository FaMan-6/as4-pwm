import 'package:flutter/material.dart';

class ThemeController {
  ThemeController._();
  static final instance = ThemeController._();

  final themeModeNotifier = ValueNotifier(ThemeMode.light);
  ThemeMode get themeMode => themeModeNotifier.value;

  void toggleDarkMode(bool isDark) {
    print('toggle dark mode active');
    themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeController = ThemeController.instance;
