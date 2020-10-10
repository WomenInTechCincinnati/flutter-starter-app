import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData createThemeData() => ThemeData(
      primarySwatch: primaryMaterialColor,
      disabledColor: primaryColorLight
  );
}

const MaterialColor primaryMaterialColor = MaterialColor(0xFF007a7c, {
  50: Color(0xFFE8EAF6),
  100: Color(0xFFC5CAE9),
  200: Color(0xFF9FA8DA),
  300: Color(0xFF7986CB),
  400: Color(0xFF5C6BC0),
  500: Color(0xFF3F51B5),
  600: Color(0xFF3949AB),
  700: Color(0xFF303F9F),
  800: Color(0xFF283593),
  900: Color(0xFF1A237E),
});

const Color primaryColorTeal = Color(0xFF007a7c);
const Color primaryColorLight = Color(0xFF99E1DD);
const Color secondaryColorGrey = Color(0xFF48484A);
const Color accentColorNavy = Color(0xFF0F283C);
const Color accentColorWhite = Color(0xFFF5F5F5);

const Color primaryTextColor = secondaryColorGrey;