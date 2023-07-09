import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppTheme { DART, LIGHT, SYSTEM }

class ThemeController extends GetxController {
  final _mode = AppTheme.SYSTEM.obs;
  ThemeMode themeMode() => _mode.value == AppTheme.DART
      ? ThemeMode.dark
      : _mode.value == AppTheme.LIGHT
          ? ThemeMode.light
          : ThemeMode.system;

  void change(AppTheme mode) {
    _mode.value = mode;
  }

  AppTheme get mode => _mode.value;
}
