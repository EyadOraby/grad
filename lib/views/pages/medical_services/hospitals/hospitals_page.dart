import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/hospitals/hospitals_form_page.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/hospital_card.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({super.key});

  @override
  State<HospitalsPage> createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
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
                "Hospitals",
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
                "Hi Aly, these are hospitals near you, which provide medical services for your condition.",
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
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => HospitalsFormPage(
                                      name: 'Dar El-Fouad',
                                      about:
                                          'About the hospitalllldsfkbdf fffffffffffffffff ffffffffffffffffffffffffffffff ffffffffffffffffffffffffffffff f',
                                      address: 'Hospital Address',
                                      workinDays: 'Sun / ',
                                      workingHours: '',
                                    )));
                      },
                    ),
                    HospitalCard(
                      location: "Cairo, Egypt",
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
                      location: "Cairo, Egypt",
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
