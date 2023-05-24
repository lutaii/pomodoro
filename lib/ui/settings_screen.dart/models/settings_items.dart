import 'package:pomodoro_app/common/palette.dart';

import 'settings_list_item.dart';
import 'settings_type.dart';

class SettingsItems {
  static List<SettingsListItem> list = [
    SettingsListItem(
      title: 'WORK',
      color: Palette.timerWorkColor,
      measurment: 'mins',
      minValue: 5,
      maxValue: 55,
      settingsType: SettingsType.work,
    ),
    SettingsListItem(
      title: 'SHORT BREAK',
      color: Palette.timerShortBreakColor,
      measurment: 'mins',
      minValue: 5,
      maxValue: 20,
      settingsType: SettingsType.shortBreak,
    ),
    SettingsListItem(
      title: 'LONG BREAK',
      color: Palette.timerLongBreakColor,
      measurment: 'mins',
      minValue: 10,
      maxValue: 40,
      settingsType: SettingsType.longBreak,
    ),
    SettingsListItem(
      title: 'ROUNDS',
      color: Palette.timerTrackColor,
      measurment: '',
      minValue: 2,
      maxValue: 8,
      settingsType: SettingsType.rounds,
    ),
  ];
}
