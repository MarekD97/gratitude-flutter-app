import 'package:app/localization/app_language.dart';
import 'package:app/themes.dart';
import 'package:app/views/about.dart';
import 'package:app/views/account/login.dart';
import 'package:app/views/account/signup.dart';
import 'package:app/views/entry/create_entry.dart';
import 'package:app/views/home.dart';
import 'package:app/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GratitudeApp extends StatefulWidget {
  const GratitudeApp({Key? key}) : super(key: key);

  @override
  State<GratitudeApp> createState() => _GratitudeAppState();
}

class _GratitudeAppState extends State<GratitudeApp> {
  final Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => const HomeView(),
    '/createEntry': (context) => const CreateEntryView(),
    '/deleteEntry': (context) => const Text("Delete entry"),
    '/signup': (context) => const SignupView(),
    '/login': (context) => const LoginView(),
    '/settings': (context) => const SettingsView(),
    '/about': (context) => const AboutView(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gratitude App',
      initialRoute: '/',
      routes: appRoutes,
      theme: GratitudeAppTheme.lightTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('pl', '')],
      locale: const Locale("pl"), // switch between en and pl to see effect
    );
  }
}

void main() => runApp(const GratitudeApp());
