

import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger( int theme ) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  set darkTheme( bool value ) {
    _darkTheme = value;
    _customTheme = false;

    _currentTheme = (value) ? ThemeData.dark() : ThemeData.light();

    notifyListeners();
  }

  set customTheme( bool value ) {
    final colorScheme = ThemeData.light().colorScheme;

    _customTheme = value;
    _darkTheme = false;

    _currentTheme = (value)
                    ? ThemeData.dark().copyWith(
                      colorScheme: ColorScheme(
                        brightness: colorScheme.brightness,
                        primary: colorScheme.primary,
                        onPrimary: colorScheme.onPrimary,
                        secondary: const Color(0xff48A0EB),
                        onSecondary: colorScheme.onSecondary,
                        error: colorScheme.error,
                        onError: colorScheme.onError,
                        background: colorScheme.background,
                        onBackground: colorScheme.onBackground,
                        surface: colorScheme.surface,
                        onSurface: colorScheme.onSurface
                      ),
                      scaffoldBackgroundColor: const Color(0xff16202B),
                      textTheme: const TextTheme(
                        bodyText1: TextStyle( color: Colors.white )
                      )
                    )
                    : ThemeData.light();

    notifyListeners();
  }

}
