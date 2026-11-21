import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/deep_links.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

/// App-wide preferences, loaded once at startup (used to sign out).
SharedPreferences? prefs;

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
    final scheme = ColorScheme.fromSeed(seedColor: SanadColors.primary, primary: SanadColors.primary, secondary: SanadColors.gold);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SANAD',
      theme: ThemeData(
        colorScheme: scheme,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: SanadColors.surface,
        cardTheme: CardThemeData(
          color: SanadColors.card,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
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
