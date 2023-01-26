import 'package:flutter/material.dart';

enum CurrentAppTheme {
  light,
  dark,
  custom
}

class AppTheme extends ChangeNotifier{
  bool _isDarkTheme = false;
  bool _isCustomTheme = false;
  late ThemeData _currentTheme;

  AppTheme(CurrentAppTheme theme){
    switch (theme) {
      case CurrentAppTheme.light:
        _isDarkTheme = false;
        _isCustomTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        );
        break;
      case CurrentAppTheme.dark:
        _isDarkTheme = true;
        _isCustomTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(secondary: Colors.pink)
        );
        break;
      case CurrentAppTheme.custom:
        _isDarkTheme = false;
        _isCustomTheme = true;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        );
        break;
      default:
        _isDarkTheme = false;
        _isCustomTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        );
    }
  }
  
  bool get isDarkTheme => _isDarkTheme;

  set isDarkTheme(bool isDarkTheme){
    _isDarkTheme = isDarkTheme;
    _isCustomTheme = false;
    _currentTheme = (isDarkTheme)
      ? ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        )
      : ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        );
    notifyListeners();
  }

  bool get isCustomTheme => _isCustomTheme;

  set isCustomTheme(bool isCustomTheme){
    _isCustomTheme = isCustomTheme;
    _isDarkTheme = false;
    _currentTheme = (isCustomTheme)
      ? ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(secondary: Color(0xff48a0eb)),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202b),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white))
      )
      : ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(secondary: Colors.pink)
        );
    notifyListeners();
  }

  ThemeData get currentTheme => _currentTheme;

}