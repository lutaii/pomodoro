import 'package:floor/floor.dart';

import '../../db_constants.dart';
import '../entity/settings_entity.dart';

@dao
abstract class SettingsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> add(SettingsEntity item);

  @Query(
    'SELECT * FROM $settingsTableName ORDER BY id DESC LIMIT 1',
  )
  Future<SettingsEntity?> getLast();

  @Query(
    'DELETE FROM $settingsTableName',
  )
  Future<void> removeAll();

  @Query(
    'SELECT * FROM $settingsTableName ORDER BY id DESC LIMIT 1',
  )
  Stream<SettingsEntity?> getLastStream();
}
