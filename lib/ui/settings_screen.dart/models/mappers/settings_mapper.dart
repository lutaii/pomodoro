import '../../../../db/settings_database/entity/settings_entity.dart';
import '../settings_model.dart';

extension SettingsEntityMapper on SettingsEntity {
  SettingsModel toSettingsModel() {
    return SettingsModel(
      workingSessionMins: workingSessionMins,
      shortBreakSessionMins: shortBreakSessionMins,
      longBreakSessionMins: longBreakSessionMins,
      rounds: rounds,
      id: id,
    );
  }
}

extension AlertSettingsDataModelMapper on SettingsModel {
  SettingsEntity toSettingsEntity() {
    return SettingsEntity(
      workingSessionMins: workingSessionMins,
      shortBreakSessionMins: shortBreakSessionMins,
      longBreakSessionMins: longBreakSessionMins,
      rounds: rounds,
      id: id,
    );
  }
}
