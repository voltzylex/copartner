import 'package:flutter/material.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      bodySmall: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),
    ),
  );
}

extension DarkMode on BuildContext {
  TextTheme get theme {
    return Theme.of(this).textTheme;
  }
}
