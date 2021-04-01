import 'package:SilentMoon/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  SharedPreferences _sharedPrefrencesInstance;

  ThemeChanger(this._sharedPrefrencesInstance);

  ThemeData getTheme() {
    bool isDark = _sharedPrefrencesInstance.getBool('isDark') ?? false;
    return isDark ? darkTheme : lightTheme;
  }

  setTheme(ThemeData theme) {
    _sharedPrefrencesInstance.setBool(
        'isDark', theme == lightTheme ? false : true);

    notifyListeners();
  }
}
