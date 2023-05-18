import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/medical_services/hospitals/hospitals_page.dart';
import 'package:grad/views/pages/login_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SANAD',
      theme: ThemeData(
          fontFamily: 'Montserrat-VariableFont_wght.ttf',
          primarySwatch: Colors.lightGreen,
          scaffoldBackgroundColor: Colors.grey.shade200),
      home: HospitalsPage(),
    );
  }
}
