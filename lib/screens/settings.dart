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
            ListTile(
              title: Text("Small text mode"),
              trailing: Switch(
                value: settings[Setting.smallTextMode]!,
                onChanged: (value) {
                  Provider.of<SettingsProvider>(context, listen: false)
                      .changeSetting(Setting.smallTextMode, value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
