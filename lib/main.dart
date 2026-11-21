import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/deep_links.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

/// App-wide preferences, loaded once at startup (used to sign out).
SharedPreferences? prefs;

/// SANAD's brand green.
const sanadGreen = Color(0xFF8BB96F);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: sanadGreen);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SANAD',
      theme: ThemeData(
        colorScheme: scheme,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFF4F6F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: scheme.primaryContainer,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: deepLinkedScreen() ?? const SplashPage(),
    );
  }
}
