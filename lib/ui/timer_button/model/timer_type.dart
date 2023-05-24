import 'package:flutter/material.dart';

import '../../../common/palette.dart';

enum TimerType {
  work,
  shortBreak,
  longBreak,
  pause,
  initial,
}

extension TimerTypeExt on TimerType {
  getTitle() {
    switch (this) {
      case TimerType.work:
        return 'WORK';
      case TimerType.shortBreak:
        return 'SHORT BREAK';
      case TimerType.longBreak:
        return 'LONG BREAK';
      case TimerType.pause:
        return 'PAUSE';
      case TimerType.initial:
        return 'START';
    }
  }

  getColor() {
    switch (this) {
      case TimerType.work:
        return Palette.timerWorkColor;
      case TimerType.shortBreak:
        return Palette.timerShortBreakColor;
      case TimerType.longBreak:
        return Palette.timerLongBreakColor;
      case TimerType.pause:
        return Palette.timerPauseColor;
      default:
        return Colors.transparent;
    }
  }
}
