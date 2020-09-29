import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeModel extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;

  /// 模式选择 0: 浅色模式 1: 深色模式 2: 随系统
  int _darkMode;

  int get darkMode => _darkMode;

  Future initThemeModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getInt("DARK_MODE") ?? 2;
    notifyListeners();
  }

  void changeMode(int darkMode) async {
    _darkMode = darkMode;

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("DARK_MODE", darkMode);
  }
}
