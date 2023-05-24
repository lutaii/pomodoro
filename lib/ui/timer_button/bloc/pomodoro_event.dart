part of timer_button;

abstract class PomodoroEvent extends Equatable {
  const PomodoroEvent();

  @override
  List<Object?> get props => [];
}

class StartEvent extends PomodoroEvent {
  const StartEvent();
}

class PauseEvent extends PomodoroEvent {
  final int seconds;
  final TimerType type;
  final double value;

  const PauseEvent(
      {required this.seconds, required this.type, required this.value});
}

class ResumeEvent extends PomodoroEvent {
  final int seconds;
  final TimerType type;
  final double value;

  const ResumeEvent(
      {required this.seconds, required this.type, required this.value});
}

class ResetEvent extends PomodoroEvent {}
