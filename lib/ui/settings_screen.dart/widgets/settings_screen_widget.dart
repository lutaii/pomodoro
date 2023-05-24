part of settings_screen;

class SettingsScreenWidget extends StatelessWidget {
  const SettingsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      child: Center(child: ListViewScreen()),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  final List<SettingsListItem> items = SettingsItems.list;

  ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.constraint8),
      child: BlocProvider<SettingsScreenCubit>(
        create: (_) => SettingsScreenCubit(
          settings: getIt<SettingsProvider>().getTemporarySettings(),
        ),
        child: BlocBuilder<SettingsScreenCubit, SettingsModel>(
          builder: (context, settings) {
            final bloc = BlocProvider.of<SettingsScreenCubit>(context);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListItemWidget(
                        item: items[index],
                        color: items[index].color,
                        measurment: items[index].measurment,
                        minValue: items[index].minValue,
                        maxValue: items[index].maxValue,
                        settingsType: items[index].settingsType,
                        settings: settings,
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: Constants.constraint40),
                  child: OutlinedButton(
                      onPressed: () {
                        bloc.resetSettings();
                      },
                      child: const Text(
                        'DEFAULT',
                        style: Constants.outlineButtonTextStyle,
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final SettingsListItem item;
  final Color color;
  final String measurment;
  final int minValue;
  final int maxValue;
  final SettingsType settingsType;
  final SettingsModel settings;

  const ListItemWidget({
    Key? key,
    required this.item,
    required this.color,
    required this.measurment,
    required this.minValue,
    required this.maxValue,
    required this.settingsType,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItemBloc = BlocProvider.of<SettingsScreenCubit>(context);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        Constants.constraint20,
      )),
      color: Palette.settingsCardColor,
      child: Padding(
        padding: const EdgeInsets.all(Constants.constraint16),
        child: Column(
          children: [
            Text(item.title, style: Constants.settignsSettingsTitleTextStyle),
            const SizedBox(height: Constants.constraint8),
            Text(
              '${getSettingsValue(settingsType, settings)} $measurment',
              style: Constants.settignsSettingsValueTextStyle,
            ),
            const SizedBox(height: Constants.constraint8),
            Slider(
              activeColor: color,
              inactiveColor: Palette.backgroundColor,
              value: getSettingsValue(settingsType, settings).toDouble(),
              onChanged: (newValue) {
                updateSettings(settingsType, listItemBloc, newValue.toInt());
              },
              min: minValue.toDouble(),
              max: maxValue.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}

int getSettingsValue(SettingsType settingsType, SettingsModel settings) {
  switch (settingsType) {
    case SettingsType.work:
      return settings.workingSessionMins;
    case SettingsType.shortBreak:
      return settings.shortBreakSessionMins;
    case SettingsType.longBreak:
      return settings.longBreakSessionMins;
    case SettingsType.rounds:
      return settings.rounds;
  }
}

void updateSettings(
    SettingsType settingsType, SettingsScreenCubit bloc, int newValue) {
  switch (settingsType) {
    case SettingsType.work:
      bloc.updateWorkingSetting(newValue);
      break;
    case SettingsType.shortBreak:
      bloc.updateShortBreakSetting(newValue);
      break;
    case SettingsType.longBreak:
      bloc.updateLongBreakSetting(newValue);
      break;
    case SettingsType.rounds:
      bloc.updateRoundSetting(newValue);
      break;
  }
}
