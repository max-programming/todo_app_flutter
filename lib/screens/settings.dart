import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool smallTextMode = false;

  @override
  Widget build(BuildContext context) {
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
                value: smallTextMode,
                onChanged: (value) {
                  setState(() {
                    smallTextMode = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
