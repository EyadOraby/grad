import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/doctors/doctors_form_page.dart';
import 'package:grad/views/widgets/doctor_card.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  TextEditingController formNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
      appBarTitle: context.t('SANAD'),
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
                context.t("Doctors"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SanadColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                context.t("Hi Aly, based on your condition here are the doctors we found near you."),
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
                    DoctorCard(
                      firstName: "Mohamed",
                      lastName: "Abdallah",
                      specialization: context.t("Neurology"),
                      location: "Giza, Egypt",
                      workinDays: "Sun - Thu",
                      workingHours: "6 - 10 PM",
                      rating: "4.2",
                      gender: "Male",
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorsFormPage()));
                      },
                    ),
                    DoctorCard(
                      firstName: "Hassan",
                      lastName: "Omar",
                      specialization: context.t("Rheumatologist"),
                      location: "Cairo, Egypt",
                      workinDays: "Thu - Sat",
                      workingHours: "8 - 12 AM",
                      rating: "4.0",
                      gender: "Male",
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorsFormPage()));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DoctorCard(
                      firstName: "Aly",
                      lastName: "Ahmed",
                      specialization: context.t("Osteopaths"),
                      location: "Giza, Egypt",
                      workinDays: "Sun - Wed",
                      workingHours: "2 - 7 PM",
                      rating: "5.0",
                      gender: "Male",
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorsFormPage()));
                      },
                    ),
                    DoctorCard(
                      firstName: "Hana",
                      lastName: "Mohamed",
                      specialization: context.t("Neurology"),
                      location: "Cairo, Egypt",
                      workinDays: "Tue - Thu",
                      workingHours: "1 - 5 PM",
                      rating: "4.6",
                      gender: "Female",
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorsFormPage()));
                      },
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
