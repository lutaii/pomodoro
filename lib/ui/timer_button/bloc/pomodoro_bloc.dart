part of timer_button;

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  final SettingsModel _settings;

  int _sessionCount = 0;

  bool _isWorkingSession = false;

  late TimerType _currentTimerType;

  StreamSubscription<int>? _tickerSubscription;
  StreamSubscription<SettingsModel>? _settingsSubscription;

  PomodoroBloc({required SettingsModel settings})
      : _settings = settings,
        super(PomodoroInitial()) {
    on<StartEvent>((event, emit) {
      if (!_isWorkingSession) {
        _isWorkingSession = true;
        _startTimer(_settings.workingSessionMins * 60, TimerType.work, emit);
      } else if (_sessionCount >= _settings.rounds) {
        _sessionCount = 0;
        _isWorkingSession = false;
        _startTimer(
            _settings.longBreakSessionMins * 60, TimerType.longBreak, emit);
      } else {
        _isWorkingSession = false;
        _startTimer(
            _settings.shortBreakSessionMins * 60, TimerType.shortBreak, emit);
      }
    });
    on<PauseEvent>(
      (event, emit) {
        _currentTimerType = event.type;
        emit(PomodoroPause(event.seconds, TimerType.pause, event.value));
        _tickerSubscription?.pause();
      },
    );
    on<ResumeEvent>(
      (event, emit) {
        emit(PomodoroRunning(
          event.seconds,
          (state is PomodoroPause) ? _currentTimerType : event.type,
          event.value,
        ));
        _tickerSubscription?.resume();
      },
    );
    on<ResetEvent>(
      (event, emit) {
        _isWorkingSession = false;
        _sessionCount = 0;
        if (state is! PomodoroInitial) {
          _tickerSubscription?.cancel();
        }
        emit(PomodoroInitial());
      },
    );
  }

  void _startTimer(
    int seconds,
    TimerType type,
    Emitter<PomodoroState> emit,
  ) {
    if (type == TimerType.work) {
      _sessionCount++;
    }
    _tickerSubscription =
        Stream.periodic(const Duration(milliseconds: 100), (x) => seconds - x)
            .take(seconds + 1)
            .listen((remainingSeconds) {
      add(ResumeEvent(
        seconds: remainingSeconds,
        type: type,
        value: 1 - (remainingSeconds / seconds),
      ));
      if (remainingSeconds == 0) {
        _tickerSubscription?.cancel();
        add(const StartEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _isWorkingSession = false;
    _sessionCount = 0;
    add(ResetEvent());
    _tickerSubscription?.cancel();
    _settingsSubscription?.cancel();
    return super.close();
  }
}
