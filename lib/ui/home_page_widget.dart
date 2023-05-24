import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/models/settings_model.dart';
import 'package:pomodoro_app/ui/settings_screen.dart/settings_screen.dart';
import 'package:pomodoro_app/ui/timer_button/timer_button.dart';

import '../common/constants.dart';
import '../di/get_it_manager.dart';
import '../common/palette.dart';
import '../provider/settings_provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  void _onBottomNavBarTap(int index) {
    if (_currentIndexNotifier.value != index) {
      _pageController.animateToPage(
        index,
        duration: Constants.bottomBarAnimationDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int index) {
    _currentIndexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Constants.appBarHeight,
        backgroundColor: Palette.backgroundColor,
        elevation: 0,
        title: const Text(
          'pomodoro',
          style: Constants.appTitleStyle,
        ),
      ),
      body: Container(
        color: Palette.backgroundColor,
        child: StreamBuilder<SettingsModel>(
            stream: getIt<SettingsProvider>().settingsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      color: Palette.backgroundColor,
                      child: const Center(
                        child: TimerButtonWidget(),
                      ),
                    ),
                    const SettingsScreenWidget(),
                  ],
                );
              } else {
                return Container();
              }
            }),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _currentIndexNotifier,
          builder: (context, index, child) {
            return CurvedNavigationBar(
              index: index,
              animationDuration: Constants.bottomBarAnimationDuration,
              backgroundColor: Palette.backgroundColor,
              color: Palette.buttonBarColor,
              items: const [
                Icon(
                  Icons.timer,
                  color: Palette.bauttonBarIconColor,
                  size: Constants.bottomBarIconSize,
                ),
                Icon(
                  Icons.settings,
                  color: Palette.bauttonBarIconColor,
                  size: Constants.bottomBarIconSize,
                ),
              ],
              onTap: _onBottomNavBarTap,
            );
          }),
    );
  }
}
