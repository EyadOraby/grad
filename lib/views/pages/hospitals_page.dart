import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/widgets/appointments_card.dart';
import 'package:grad/views/widgets/doctor_card.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';
import 'package:grad/views/widgets/hospital_card.dart';
import 'package:grad/views/widgets/ic_services_button.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({Key? key}) : super(key: key);

  @override
  State<HospitalsPage> createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  TextEditingController formNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {}

  @override
  void dispose() {
    formNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    final deviceSize = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: 'SANAD',
      index: 2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 15,
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              child: Text(
                "Doctors",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 129, 62),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Hi.. Aly, these are hospitals near you, which provide medical services for your condition.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HospitalCard(
                      location: "Giza, Egypt",
                      name: "Dar El-Fouad",
                      workinDays: "All Week",
                      workingHours: 'All Day',
                      rating: "4.6",
                      click: () {},
                    ),
                    HospitalCard(
                      location: "Cario, Egypt",
                      name: "Cleopatra",
                      workinDays: "All Week",
                      workingHours: 'All Day',
                      rating: "3.7",
                      click: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HospitalCard(
                      location: "Giza, Egypt",
                      name: "Agooza",
                      workinDays: "Sun - Thu",
                      workingHours: 'All Day',
                      rating: "4.0",
                      click: () {},
                    ),
                    HospitalCard(
                      location: "Cario, Egypt",
                      name: "Alzahara",
                      workinDays: "All Week",
                      workingHours: '7 AM - 2 AM',
                      rating: "4.2",
                      click: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
