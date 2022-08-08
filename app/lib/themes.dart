import 'package:flutter/material.dart';

class GratitudeAppTheme {
  // Default colors in app
  static const Color darkGreen = Color(0xFF377E51);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF757575);

  // Pastel colors for entries
  static const Color pastelRed = Color(0xFFFFE5E5);
  static const Color pastelGreen = Color(0xFFE5FFEF);
  static const Color pastelOrange = Color(0xFFFFEEE5);

  static ThemeData get lightTheme {
    return ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: darkGreen,
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
          bodyText1: TextStyle(
        color: darkGreen,
      )),

      // Define the default font family
      fontFamily: 'Mali',

      // Define the default app bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: darkGreen,
      ),

      // Define the default tab bar theme
      tabBarTheme: const TabBarTheme(
        labelColor: darkGreen,
        unselectedLabelColor: darkGrey,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: darkGreen, width: 2.0)),
      ),

      // Define the default elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(darkGreen),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          )),
          padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 16.0)),
        ),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: darkGreen),
      listTileTheme:
          ListTileThemeData(textColor: Colors.black.withOpacity(0.54), iconColor: Colors.black.withOpacity(0.54)),
      drawerTheme: const DrawerThemeData(backgroundColor: lightGrey),
    );
  }
}
