import 'package:flutter/material.dart';

import 'palette.dart';

class Constants {
  static const bottomBarAnimationDuration = Duration(milliseconds: 200);

  static const double bottomBarIconSize = 30;

  static const double appBarHeight = 75;

  static const double timerBlurRadius = 25;

  static const double strokeWidth = 15;
  static const double trackWidth = 5;

  static const TextStyle appTitleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle outlineButtonTextStyle = TextStyle(
    color: Palette.outlineButtonTextColor,
    fontSize: 20,
  );

  static const TextStyle timerTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Palette.timerTitleColor,
  );

  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 70,
    fontWeight: FontWeight.w400,
    color: Palette.timerColor,
  );

  static const TextStyle settignsSettingsTitleTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Palette.settingsTitleColor,
  );

  static const TextStyle settignsSettingsValueTextStyle = TextStyle(
    fontSize: 18.0,
    color: Palette.settingsValueColor,
  );

  static const double constraint8 = 8;

  static const double constraint16 = 16;

  static const double constraint20 = 20;

  static const double constraint30 = 30;

  static const double constraint40 = 40;

  static const double constraint50 = 50;

  static const double constraint120 = 120;
}
