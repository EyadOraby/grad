import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grad/deep_links.dart';
import 'package:grad/state/sanad_store.dart';
import 'package:grad/views/pages/gov_services/IC_services/new_IC_form_page.dart';
import 'package:grad/views/pages/medical_services/doctors/doctors_form_page.dart';
import 'package:grad/views/pages/medical_services/hospitals/hospitals_form_page.dart';
import 'package:grad/views/pages/medical_services/physiotherapy/physio_centers_page.dart';
import 'package:grad/views/pages/medical_services/radiology/radio_centers_page.dart';

void main() {
  // Tests use a wide placeholder font by default; load the app's real font so layout matches the app.
  setUpAll(() async {
    final font = File('assets/Montserrat-VariableFont_wght.ttf').readAsBytes().then((b) => ByteData.sublistView(b));
    await (FontLoader('Montserrat')..addFont(font)).load();
  });

  final screens = <String, Widget Function()>{
    ...demoScreens,
    'new IC form': () => const NewICFormPage(),
    'doctor form': () => const DoctorsFormPage(),
    'hospital form': () => const HospitalsFormPage(
          name: 'Cleopatra', about: 'A general hospital.', address: 'Hospital Address', workinDays: 'All Week', workingHours: 'All Day'),
    'physiotherapy': () => const PhysioCentersPage(),
    'radiology': () => const RadioCentersPage(),
  };

  for (final arabic in [false, true]) {
    for (final size in [const Size(390, 844), const Size(1280, 800)]) {
      final label = '${arabic ? 'ar' : 'en'} ${size.width.toInt()}px';
      for (final entry in screens.entries) {
        testWidgets('${entry.key} renders ($label)', (tester) async {
          sanadStore = SanadStore(MemorySanadStorage());
          sanadStore.seedDemoCitizen();
          if (arabic) sanadStore.toggleLanguage();
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(MaterialApp(
            theme: ThemeData(fontFamily: 'Montserrat'),
            home: Directionality(
              textDirection: arabic ? TextDirection.rtl : TextDirection.ltr,
              child: entry.value(),
            ),
          ));
          await tester.pump(const Duration(milliseconds: 500));

          expect(tester.takeException(), isNull);
          expect(find.byType(Scaffold), findsWidgets);
        });
      }
    }
  }
}
