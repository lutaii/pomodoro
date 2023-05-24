import 'dart:async';

import 'package:floor/floor.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/mappers/settings_mapper.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';

import 'dao/settings_dao.dart';
import 'entity/settings_entity.dart';

part 'settings_database.g.dart';

@Database(version: 1, entities: [
  SettingsEntity,
])
abstract class SettingsDatabase extends FloorDatabase {
  SettingsDao get settingsDao;

  Future<void> initSettings(SettingsModel defaultAlertSettings) async {
    if (await settingsDao.getLast() == null) {
      await settingsDao.add(defaultAlertSettings.toSettingsEntity());
    }
  }
}
