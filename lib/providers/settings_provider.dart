import 'package:flutter/material.dart';

enum Setting { smallTextMode }

class SettingsProvider extends ChangeNotifier {
  Map<Setting, bool> settings = {Setting.smallTextMode: false};

  void changeSetting(Setting setting, bool value) {
    settings[setting] = value;
    notifyListeners();
  }
}
