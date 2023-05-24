part of settings_screen;

class SettingsScreenCubit extends Cubit<SettingsModel> {
  SettingsScreenCubit({required SettingsModel settings})
      : _settings = settings,
        super(settings);

  SettingsModel _settings;

  void updateWorkingSetting(int workingSessionMinutes) {
    _settings = _settings.copyWith(workingSessionMins: workingSessionMinutes);
    emit(_settings);
    getIt<SettingsProvider>().saveSettings(_settings);
  }

  void updateShortBreakSetting(int shortBreakSessionMinutes) {
    _settings =
        _settings.copyWith(shortBreakSessionMins: shortBreakSessionMinutes);
    getIt<SettingsProvider>().saveSettings(_settings);
    emit(_settings);
  }

  void updateLongBreakSetting(int longBreakSessionMinutes) {
    _settings =
        _settings.copyWith(longBreakSessionMins: longBreakSessionMinutes);
    getIt<SettingsProvider>().saveSettings(_settings);
    emit(_settings);
  }

  void updateRoundSetting(int rounds) {
    _settings = _settings.copyWith(rounds: rounds);
    getIt<SettingsProvider>().saveSettings(_settings);
    emit(_settings);
  }

  void resetSettings() {
    _settings = defaultSettings;
    getIt<SettingsProvider>().saveSettings(_settings);
    emit(_settings);
  }
}
