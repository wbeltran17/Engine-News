import 'package:engine_news/models/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  String _theme = ThemePreference.LIGHT;

  set setTheme(String theme) {
    _theme = theme;
    themePreference.setModeTheme(theme);
    notifyListeners();
  }

  Color getTheme() =>  _theme == ThemePreference.DARK ? Colors.black
                          : Colors.white;
  Color getOppositeTheme() =>
      _theme == ThemePreference.DARK ? Colors.white
                          : Colors.black;
  bool isDarkTheme() => _theme == ThemePreference.DARK;
}
