import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final lightTheme = _buildLightTheme();
final darkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
      accentColor: const Color(0xFFA0A3B1),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(backgroundColor: Colors.white));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
      accentColor: const Color(0xFF586894),
      scaffoldBackgroundColor: const Color(0xFF03174C),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF03174C),
        iconTheme: IconThemeData(color: const Color(0xff3F414E)),
        centerTitle: true,
        elevation: 0,
      ));
}
