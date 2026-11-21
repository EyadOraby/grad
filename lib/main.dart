import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad/deep_links.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/views/pages/accessibility_page.dart';
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
  sanadStore = SanadStore(PrefsSanadStorage(prefs!));
  // `?demo=1` fills in some activity so the web demo can be explored at once.
  if (Uri.base.queryParameters['demo'] == '1' && sanadStore.myRequests.isEmpty) {
    final r = sanadStore.submitRequest(service: 'National ID renewal');
    sanadStore.advanceRequest(r.reference);
    sanadStore.submitRequest(service: 'Integrated services card');
    final day = DateTime.now().add(const Duration(days: 2));
    sanadStore.book(provider: 'Dr. Hana Mohamed', kind: 'Doctor', when: DateTime(day.year, day.month, day.day, 11));
    sanadStore.apply(jobTitle: 'Data Entry', company: 'Orange');
  }
  runApp(const MyApp());
}

/// Saves SANAD's data in SharedPreferences.
class PrefsSanadStorage implements SanadStorage {
  PrefsSanadStorage(this._prefs);
  final SharedPreferences _prefs;
  static const _key = 'sanad_state';

  @override
  String? read() => _prefs.getString(_key);

  @override
  Future<void> write(String value) => _prefs.setString(_key, value);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: sanadStore,
      builder: (context, _) => _app(sanadStore.settings),
    );
  }

  Widget _app(AccessibilitySettings settings) {
    final hc = settings.highContrast;
    final base = ColorScheme.fromSeed(seedColor: SanadColors.primary, primary: SanadColors.primary, secondary: SanadColors.gold);
    // High contrast: darker primary, pure black text and visible outlines.
    final scheme = hc
        ? base.copyWith(primary: const Color(0xFF003B2F), onSurface: Colors.black, outline: Colors.black, onSurfaceVariant: Colors.black)
        : base;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SANAD',
      theme: ThemeData(
        colorScheme: scheme,
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: hc ? Colors.white : SanadColors.surface,
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
      builder: (context, child) => applyAccessibility(context, child, settings),
      home: deepLinkedScreen() ?? const SplashPage(),
    );
  }
}
