import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple[900]!,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white60,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(width: 2, color: Colors.white),
          ),
          errorStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
}
