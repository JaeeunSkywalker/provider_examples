import 'package:flutter/material.dart';

class ThemeSettingsProvider with ChangeNotifier {
   String _selectedImage;

   ThemeSettingsProvider(this._selectedImage);

  String get selectedImage => _selectedImage;

  void updateImageBasedOnTemperature(double temp) {
    if (temp >= 20.0) {
      _selectedImage = 'gettingHotImage';
    } else if (temp < 10.0) {
      _selectedImage = 'gettingColdImage';
    }
    notifyListeners();
  }
}
