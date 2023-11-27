import 'package:flutter/material.dart';
import 'package:patrocle_education/Themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  String? mode = 'dark';

  void getThemeData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    mode = pref.getString('name');
  }

  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Future<void> saveMode(mode) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('mode', mode);
  }

  int getTheme() {
    if (_themeData == lightMode) {
      return 0;
    } else {
      return 1;
    }
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      saveMode("dark");
    } else {
      themeData = lightMode;
      saveMode("light");
    }
  }
}
