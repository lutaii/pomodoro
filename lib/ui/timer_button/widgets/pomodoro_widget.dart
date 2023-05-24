part of timer_button;

class TimerButtonWidget extends StatefulWidget {
  const TimerButtonWidget({
    super.key,
  });

  @override
  State<TimerButtonWidget> createState() => _TimerButtonWidgetState();
}

class _TimerButtonWidgetState extends State<TimerButtonWidget>
    with SingleTickerProviderStateMixin {
  bool _isPaused = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SettingsModel>(
        stream: getIt<SettingsProvider>().settingsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
                create: (context) =>
                    PomodoroBloc(settings: snapshot.requireData),
                child: BlocBuilder<PomodoroBloc, PomodoroState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _isPaused = !_isPaused;
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(getEvent(state, _isPaused));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width -
                                  Constants.constraint50 * 2,
                              height: MediaQuery.of(context).size.width -
                                  Constants.constraint50 * 2,
                              decoration: BoxDecoration(
                                color: Palette.timerButtonColor,
                                borderRadius: BorderRadius.circular(
                                    (MediaQuery.of(context).size.width -
                                            Constants.constraint50 * 2) /
                                        2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Palette.shadowColor,
                                    blurRadius: Constants.timerBlurRadius,
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        Constants.constraint50 * 2,
                                    height: MediaQuery.of(context).size.width -
                                        Constants.constraint50 * 2,
                                    child: CustomCircularProgressIndicator(
                                      value: getValue(state),
                                      backgroundColor: Palette.timerTrackColor,
                                      valueColor: getType(state).getColor(),
                                      strokeWidth: Constants.strokeWidth,
                                      trackWidth: Constants.trackWidth,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: Constants.constraint30,
                                    ),
                                    child: state is! PomodoroInitial
                                        ? Text(
                                            getTimer(state),
                                            style: Constants.timerTextStyle,
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: Constants.constraint120,
                                    ),
                                    child: Text(getType(state).getTitle(),
                                        style: Constants.timerTitleTextStyle),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: Constants.constraint50,
                        ),
                        OutlinedButton(
                          child: const Text(
                            'RESET',
                            style: Constants.outlineButtonTextStyle,
                          ),
                          onPressed: () {
                            BlocProvider.of<PomodoroBloc>(context)
                                .add(ResetEvent());
                          },
                        ),
                      ],
                    );
                  },
                ));
          } else {
            return Container();
          }
        });
  }
}

TimerType getType(PomodoroState state) {
  if (state is PomodoroRunning) {
    return state.timerType;
  } else if (state is PomodoroPause) {
    return state.timerType;
  } else {
    return TimerType.initial;
  }
}

double getValue(PomodoroState state) {
  if (state is PomodoroRunning) {
    return state.value;
  } else if (state is PomodoroPause) {
    return state.value;
  } else {
    return 0;
  }
}

PomodoroEvent getEvent(PomodoroState state, bool isPaused) {
  if (state is PomodoroInitial) {
    return const StartEvent();
  } else if (!isPaused && state is PomodoroRunning) {
    return PauseEvent(
        seconds: state.seconds, type: state.timerType, value: state.value);
  } else if (isPaused && state is PomodoroPause) {
    return ResumeEvent(
        seconds: state.seconds, type: state.timerType, value: state.value);
  } else {
    throw Exception('Unexpected event');
  }
}

String getTimer(PomodoroState state) {
  late int seconds;
  if (state is PomodoroPause) {
    seconds = state.seconds;
  } else if (state is PomodoroRunning) {
    seconds = state.seconds;
  } else {
    return '';
  }
  String minutesString = (seconds ~/ 60).toString().padLeft(2, '0');
  String secondsString = (seconds % 60).toString().padLeft(2, '0');

  return '$minutesString:$secondsString';
}
