import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services/IC_services/IC_services_page.dart';
import 'package:grad/views/pages/gov_services/ID_services/ID_Renew_services_page.dart';
import 'package:grad/views/pages/gov_services/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/jobs_services/jobs_page.dart';
import 'package:grad/views/pages/medical_services/doctors/doctors_page.dart';
import 'package:grad/views/pages/medical_services/hospitals/hospitals_page.dart';
import 'package:grad/views/pages/medical_services/medical_services_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';

/// Screens the web demo can open directly, e.g. `?screen=medical`.
final Map<String, Widget Function()> demoScreens = {
  'home': () => const HomePage(),
  'signup': () => const SignUpPage(),
  'government': () => const GovServicesPage(),
  'id': () => const IDServicesPage(),
  'ic': () => const ICServicesPage(),
  'medical': () => const MedicalServicesPage(),
  'hospitals': () => const HospitalsPage(),
  'doctors': () => const DoctorsPage(),
  'jobs': () => const JobsPage(),
};

/// The screen named in the page URL on the web, if any.
Widget? deepLinkedScreen([Uri? url]) {
  if (!kIsWeb && url == null) return null;
  final name = (url ?? Uri.base).queryParameters['screen'];
  return demoScreens[name]?.call();
}
