import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
    appBarTheme:  AppBarTheme(
      backgroundColor: Colors.black.withOpacity(.5),
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
      ),
    ),
  );
}
