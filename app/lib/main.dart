import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:app/views/entry/create_entry.dart';
import 'package:app/views/home.dart';
import 'package:app/themes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gratitude App',
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the HomeScreen widget.
      '/': (context) => const HomeView(),
      '/createEntry': (context) => const CreateEntryView(),
      '/deleteEntry': (context) => Container(),
      '/signup': (context) => Container(),
      '/login': (context) => Container(),
      '/settings': (context) => Container(),
      '/about': (context) => Container(),
    },
    theme: GratitudeAppTheme.lightTheme,
    localizationsDelegates: const [
      AppLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en', ''), Locale('pl', '')],
    locale: const Locale("pl"), // switch between en and pl to see effect
  ));
}

// this class is used for localizations
class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String getText(String key) => language[key];
}

late Map<String, dynamic> language;

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    String string = await rootBundle
        .loadString("assets/strings/${locale.languageCode}.json");
    language = json.decode(string);
    return SynchronousFuture<AppLocalizations>(AppLocalizations());
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
