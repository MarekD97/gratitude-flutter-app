import 'package:flutter/material.dart';
import 'package:app/views/home/index.dart';
import 'package:app/themes.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gratitude App',
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the HomeScreen widget.
      '/': (context) => HomeScreen(),
      '/my': (context) => Container(),
    },
    theme: GratitudeAppTheme.lightTheme,
  ));
}
