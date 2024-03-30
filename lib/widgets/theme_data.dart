import 'package:flutter/material.dart';

TextTheme TextThemes(Color secoundaryTextColor, Color primaryTextColor, String defaultfontfamily) {
    return TextTheme(
          titleMedium: TextStyle(
              fontFamily: defaultfontfamily,
              color: secoundaryTextColor,
              fontSize: 16),
          titleLarge: TextStyle(
              fontFamily: defaultfontfamily,
              color: primaryTextColor,
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontFamily: defaultfontfamily,
              fontSize: 14,
              color: const Color(0xff376AED),
              fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
              fontFamily: defaultfontfamily,
              color: secoundaryTextColor,
              fontSize: 14));
  }