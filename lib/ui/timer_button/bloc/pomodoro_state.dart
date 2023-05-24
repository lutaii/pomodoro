part of timer_button;

abstract class PomodoroState {}

class PomodoroInitial extends PomodoroState {}

class PomodoroRunning extends PomodoroState {
  final int seconds;
  final TimerType timerType;
  final double value;

  PomodoroRunning(this.seconds, this.timerType, this.value);
}

class PomodoroPause extends PomodoroState {
  final TimerType timerType;
  final int seconds;
  final double value;

  PomodoroPause(this.seconds, this.timerType, this.value);
}
