import 'package:flutter/material.dart';

import 'location_provider.dart';
import 'theme_settings_provider.dart';
import 'weather_provider.dart';

class AppSettingsProvider with ChangeNotifier {
  final LocationProvider locationProvider;
  final WeatherProvider weatherProvider;
  final ThemeSettingsProvider themeSettingsProvider;

  String newThemeImage = '';

  AppSettingsProvider({
    required this.locationProvider,
    required this.weatherProvider,
    required this.themeSettingsProvider,
  }) {
    // 초기 설정 또는 의존성 프로바이더의 변경 사항에 대한 리스너 설정
    locationProvider.addListener(notifyListeners);
    weatherProvider.addListener(notifyListeners);
    themeSettingsProvider.addListener(notifyListeners);
  }

  void updateSettings() {
    themeSettingsProvider
        .updateImageBasedOnTemperature(weatherProvider.degrees);
    notifyListeners();
  }

  @override
  void dispose() {
    locationProvider.removeListener(notifyListeners);
    weatherProvider.removeListener(notifyListeners);
    themeSettingsProvider.removeListener(notifyListeners);
    super.dispose();
  }
}
