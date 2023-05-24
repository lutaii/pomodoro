import 'timer_type.dart';

class TimerViewModel {
  TimerViewModel({
    required this.timerType,
    required this.timerDuration,
  });

  final TimerType timerType;
  final int timerDuration;
}
