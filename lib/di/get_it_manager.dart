import 'package:get_it/get_it.dart';
import 'package:pomodoro_app/provider/settings_provider.dart';

import '../db/db_constants.dart';
import '../db/settings_database/settings_database.dart';

GetIt getIt = GetIt.asNewInstance();

class GetItManager {
  Future<void> configure(
    GetIt getIt,
  ) async {
    registerSettingsDataBase(getIt);
    registerSettingsProvider(getIt);
  }

  void registerSettingsDataBase(GetIt getIt) {
    getIt.registerSingletonAsync<SettingsDatabase>(
      $FloorSettingsDatabase.databaseBuilder(settingsTableName).build,
      dispose: (db) async => await db.close(),
    );
  }

  void registerSettingsProvider(GetIt getIt) {
    getIt.registerSingletonWithDependencies<SettingsProvider>(
      () => SettingsProviderImpl(database: getIt<SettingsDatabase>()),
      dependsOn: [SettingsDatabase],
    );
  }
}
