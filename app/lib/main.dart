import 'package:app/views/entry/create_entry.dart';
import 'package:flutter/material.dart';
import 'package:app/views/home.dart';
import 'package:app/themes.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gratitude App',
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the HomeScreen widget.
      '/': (context) => const HomeView(),
      '/my': (context) => Container(),
      '/create': (context) => const CreateEntryView(),
    },
    theme: GratitudeAppTheme.lightTheme,
  ));
}
