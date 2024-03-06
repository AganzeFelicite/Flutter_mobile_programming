import 'package:flutter/material.dart';
import 'package:learning/theme/light_theme.dart';
import '../theme/dark_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  String userRole = '';
  ThemeData _themeData1 = lightMode;
  ThemeData _themeData2 = darkMode;
  ThemeData get themeData2 => _themeData2;
  ThemeData get themeData1 => _themeData1;

  late SharedPreferences storage;

  //Custom dark theme

  //Now we want to save the last changed theme value

  //Dark mode toggle action
  changeTheme() {
    _isDark = !isDark;

    //Save the value to secure storage
    storage.setBool("isDark", _isDark);
    userRole = 'admin';
    notifyListeners();
  }

  //Init method of provider
  init() async {
    //After we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
