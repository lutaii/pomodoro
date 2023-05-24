import 'dart:async';

import 'package:pomodoro_app/db/settings_database/settings_database.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/mappers/settings_mapper.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';

import '../db/settings_database/entity/settings_entity.dart';

abstract class SettingsProvider {
  Stream<SettingsModel> get settingsStream;

  Future<void> saveSettings(SettingsModel settings);

  Future<void> getLastSettings();

  SettingsModel getTemporarySettings();
}

class SettingsProviderImpl extends SettingsProvider {
  SettingsProviderImpl({required SettingsDatabase database})
      : _database = database;

  final SettingsDatabase _database;
  late SettingsModel _temporarySettings;

  @override
  Stream<SettingsModel> get settingsStream => _database.settingsDao
      .getLastStream()
      .skipWhile((entity) => entity == null)
      .cast<SettingsEntity>()
      .map((entity) => entity.toSettingsModel())
      .asBroadcastStream();

  @override
  Future<void> saveSettings(SettingsModel settings) async {
    _temporarySettings = settings;
    unawaited(_database.settingsDao.add(settings.toSettingsEntity()));
  }

  @override
  Future<void> getLastSettings() async {
    final entity = await _database.settingsDao.getLast();
    if (entity == null) {
      _temporarySettings = defaultSettings;
    } else {
      _temporarySettings = entity.toSettingsModel();
    }
  }

  @override
  SettingsModel getTemporarySettings() {
    return _temporarySettings;
  }
}
