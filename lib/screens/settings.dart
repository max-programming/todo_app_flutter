import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/providers/settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<Setting, bool> settings =
        Provider.of<SettingsProvider>(context).settings;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBGColor,
        title: Text('Settings'),
      ),
      body: Container(
        child: Column(
          children: [
            SettingTile(
              settings: settings,
              setting: Setting.smallTextMode,
              settingText: "Small text mode",
            ),
            SettingTile(
              settings: settings,
              setting: Setting.disableDeleteConfirmation,
              settingText: "Disable delete confirmation",
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.settings,
    required this.setting,
    required this.settingText,
  }) : super(key: key);

  final Map<Setting, bool> settings;
  final String settingText;
  final Setting setting;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(settingText),
      trailing: Switch(
        activeColor: tdBlue,
        value: settings[setting]!,
        onChanged: (value) {
          Provider.of<SettingsProvider>(context, listen: false)
              .changeSetting(setting, value);
        },
      ),
    );
  }
}
