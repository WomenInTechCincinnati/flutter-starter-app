import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData createThemeData() => ThemeData(
      scaffoldBackgroundColor: primaryColorLight,
      primarySwatch: primaryMaterialColor,
      disabledColor: primaryColorLight
  );
}

const MaterialColor primaryMaterialColor = MaterialColor(0xFF007a7c, {
  50: Color(0xFFDFF6F6),
  100: Color(0xFFB0E8E8),
  200: Color(0xFF7DD9DA),
  300: Color(0xFF4AC9CC),
  400: Color(0xFF23BDC4),
  500: Color(0xFF00B2BD),
  600: Color(0xFF00A3AB),
  700: Color(0xFF008E93),
  800: Color(0xFF007a7c),
  900: Color(0xFF055754),
});

const Color primaryColorTeal = Color(0xFF007a7c);
const Color primaryColorLight = Color(0xFF99E1DD);
const Color secondaryColorGrey = Color(0xFF48484A);
const Color accentColorNavy = Color(0xFF0F283C);
const Color accentColorWhite = Color(0xFFF5F5F5);

const Color primaryTextColor = secondaryColorGrey;

const ColorFilter greyScaleColorFilter = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
