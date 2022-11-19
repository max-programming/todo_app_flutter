import 'package:flutter/material.dart';

enum Setting { smallTextMode, disableDeleteConfirmation }

class SettingsProvider extends ChangeNotifier {
  Map<Setting, bool> settings = {
    Setting.smallTextMode: false,
    Setting.disableDeleteConfirmation: false,
  };

  void changeSetting(Setting setting, bool value) {
    settings[setting] = value;
    notifyListeners();
  }
}
