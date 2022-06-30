import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  //the underscore makes the property private and can only be used in this class
  ThemeData _themeData;
  //Constructor that recives the theme data
  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
