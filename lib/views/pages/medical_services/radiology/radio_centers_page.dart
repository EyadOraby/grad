import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/radiology/radio_center_form_page.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/radio_center_card.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class RadioCentersPage extends StatefulWidget {
  const RadioCentersPage({super.key});

  @override
  State<RadioCentersPage> createState() => _RadioCentersPageState();
}

class _RadioCentersPageState extends State<RadioCentersPage> {
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
                context.t("Radiology Centers"),
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
                context.t("Hi Aly, these are Radiology Centers near you, which provide medical services for your condition."),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                RadioCenterCard(
                    location: "Alexandria, Egypt",
                    name: "Alexandria Radiology",
                    workinDays: "Sun / Tues / Thu / Sat",
                    workingHours: "10 AM - 10 PM",
                    rating: "4.6",
                    click: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RadioCenterFormPage(
                                    name: 'Alexandria, Egypt',
                                    about:
                                        'About the hospitalllldsfkbdf fffffffffffffffff ffffffffffffffffffffffffffffff ffffffffffffffffffffffffffffff f',
                                    address: 'Hospital Address',
                                    workinDays: 'Sun / Tues / Thu / Sat',
                                    workingHours: '10 AM - 10 PM',
                                  )));
                    })
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
