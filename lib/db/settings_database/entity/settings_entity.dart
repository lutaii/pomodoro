import 'package:floor/floor.dart';

import '../../db_constants.dart';

@Entity(tableName: settingsTableName)
class SettingsEntity {
  SettingsEntity({
    required this.workingSessionMins,
    required this.shortBreakSessionMins,
    required this.longBreakSessionMins,
    required this.rounds,
    required this.id,
  });

  @PrimaryKey()
  final int id;
  final int workingSessionMins;
  final int shortBreakSessionMins;
  final int longBreakSessionMins;
  final int rounds;
}
