import 'package:flutter/material.dart';
import 'package:pomodoro_app/common/palette.dart';
import 'package:pomodoro_app/provider/settings_provider.dart';
import 'package:pomodoro_app/ui/home_page_widget.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';

import 'db/settings_database/settings_database.dart';
import 'di/get_it_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetItManager().configure(getIt);
  await getIt.allReady();
  await getIt<SettingsDatabase>().initSettings(defaultSettings);
  await getIt<SettingsProvider>().getLastSettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro App',
      home: const HomePageWidget(),
      theme: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Palette.outlineButtonSplashColor,
            backgroundColor: Palette.outlineBackgorundColor,
          ),
        ),
      ),
    );
  }
}
