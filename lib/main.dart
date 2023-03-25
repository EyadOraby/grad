import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/login_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  prefs = await SharedPreferences.getInstance();
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
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey.shade200),
      home: GovServicesPage(),
    );
  }
}
