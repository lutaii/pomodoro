// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api

part of 'settings_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorSettingsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SettingsDatabaseBuilder databaseBuilder(String name) =>
      _$SettingsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SettingsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SettingsDatabaseBuilder(null);
}

class _$SettingsDatabaseBuilder {
  _$SettingsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SettingsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SettingsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SettingsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SettingsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SettingsDatabase extends SettingsDatabase {
  _$SettingsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SettingsDao? _settingsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `settingsTableName` (`id` INTEGER NOT NULL, `workingSessionMins` INTEGER NOT NULL, `shortBreakSessionMins` INTEGER NOT NULL, `longBreakSessionMins` INTEGER NOT NULL, `rounds` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SettingsDao get settingsDao {
    return _settingsDaoInstance ??= _$SettingsDao(database, changeListener);
  }
}

class _$SettingsDao extends SettingsDao {
  _$SettingsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _settingsEntityInsertionAdapter = InsertionAdapter(
            database,
            'settingsTableName',
            (SettingsEntity item) => <String, Object?>{
                  'id': item.id,
                  'workingSessionMins': item.workingSessionMins,
                  'shortBreakSessionMins': item.shortBreakSessionMins,
                  'longBreakSessionMins': item.longBreakSessionMins,
                  'rounds': item.rounds
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SettingsEntity> _settingsEntityInsertionAdapter;

  @override
  Future<SettingsEntity?> getLast() async {
    return _queryAdapter.query(
        'SELECT * FROM settingsTableName ORDER BY id DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => SettingsEntity(
            workingSessionMins: row['workingSessionMins'] as int,
            shortBreakSessionMins: row['shortBreakSessionMins'] as int,
            longBreakSessionMins: row['longBreakSessionMins'] as int,
            rounds: row['rounds'] as int,
            id: row['id'] as int));
  }

  @override
  Future<void> removeAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM settingsTableName');
  }

  @override
  Stream<SettingsEntity?> getLastStream() {
    return _queryAdapter.queryStream(
        'SELECT * FROM settingsTableName ORDER BY id DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => SettingsEntity(
            workingSessionMins: row['workingSessionMins'] as int,
            shortBreakSessionMins: row['shortBreakSessionMins'] as int,
            longBreakSessionMins: row['longBreakSessionMins'] as int,
            rounds: row['rounds'] as int,
            id: row['id'] as int),
        queryableName: 'settingsTableName',
        isView: false);
  }

  @override
  Future<void> add(SettingsEntity item) async {
    await _settingsEntityInsertionAdapter.insert(
        item, OnConflictStrategy.replace);
  }
}
