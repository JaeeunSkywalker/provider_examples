import 'package:flutter/material.dart';

import 'settings.dart';

// ChangeNotifier를 mixin함으로써 ChangeNotifier의 메서드와 속성을 사용할 수 있게 된다.
// 상태 변화를 알릴 수 있는 기능을 갖게 된다.
class SettingsNotifier with ChangeNotifier {
  Settings _settings;

  SettingsNotifier(this._settings);

  void updateDarkMode(bool isDarkMode) {
    _settings.isDarkMode = isDarkMode;
    notifyListeners();
  }

  bool get isDarkMode => _settings.isDarkMode;

}