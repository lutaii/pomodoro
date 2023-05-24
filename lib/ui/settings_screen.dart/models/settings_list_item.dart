import 'dart:ui';

import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_type.dart';

class SettingsListItem {
  final String title;
  final Color color;
  final String measurment;
  final int minValue;
  final int maxValue;
  final SettingsType settingsType;

  SettingsListItem({
    required this.title,
    required this.color,
    required this.measurment,
    required this.minValue,
    required this.maxValue,
    required this.settingsType,
  });
}
