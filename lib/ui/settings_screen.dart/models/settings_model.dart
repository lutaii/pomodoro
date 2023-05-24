class SettingsModel {
  SettingsModel({
    required this.workingSessionMins,
    required this.shortBreakSessionMins,
    required this.longBreakSessionMins,
    required this.rounds,
    required this.id,
  });

  final int id;
  final int workingSessionMins;
  final int shortBreakSessionMins;
  final int longBreakSessionMins;
  final int rounds;

  SettingsModel copyWith({
    int? workingSessionMins,
    int? shortBreakSessionMins,
    int? longBreakSessionMins,
    int? rounds,
    int? id,
  }) {
    return SettingsModel(
      workingSessionMins: workingSessionMins ?? this.workingSessionMins,
      shortBreakSessionMins:
          shortBreakSessionMins ?? this.shortBreakSessionMins,
      longBreakSessionMins: longBreakSessionMins ?? this.longBreakSessionMins,
      rounds: rounds ?? this.rounds,
      id: id ?? this.id,
    );
  }
}

final defaultSettings = SettingsModel(
  workingSessionMins: 25,
  shortBreakSessionMins: 5,
  longBreakSessionMins: 20,
  rounds: 3,
  id: 1,
);
