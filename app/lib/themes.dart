import 'package:flutter/material.dart';

class GratitudeAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: const Color(0xFF377E51),
      backgroundColor: Colors.white,
      textTheme: const TextTheme(bodyText1: TextStyle(
        color: Color(0xFF377E51),
      )
      ),
      // Define the default font family
      fontFamily: 'Mali',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF377E51),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: const Color(0xFF377E51),
        unselectedLabelColor: Colors.grey[600],
        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: Color(0xFF377E51), width: 2.0)),
      ),
    );
  }
}