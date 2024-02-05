import 'package:covid/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = appThemeLight;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == appThemeLight) {
      themeData = appThemeDark;
    } else {
      themeData = appThemeLight;
    }
  }
}
