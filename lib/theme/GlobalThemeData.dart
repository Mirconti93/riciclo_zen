import 'package:flutter/material.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(colorScheme: colorScheme, focusColor: focusColor);
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    onPrimary: Colors.black,
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFFBF00),
    onPrimary: Colors.white,
    secondary: Color(0xFF292B2),
    onSecondary: Color(0xFFFFBF00),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFF292B2F),
    onSurface: Colors.white,
    brightness: Brightness.light,
  );

}