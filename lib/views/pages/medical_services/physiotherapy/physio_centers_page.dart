import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/physiotherapy/physio_center_form_page.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/physio_center_card.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class PhysioCentersPage extends StatefulWidget {
  const PhysioCentersPage({super.key});

  @override
  State<PhysioCentersPage> createState() => _PhysioCentersPageState();
}

class _PhysioCentersPageState extends State<PhysioCentersPage> {
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
                context.t("Physiotherapy Centers"),
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
                context.t("Hi Aly, these are Physiotherapy Centers near you, which provide medical services for your condition."),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                PhysioCenterCard(
                    location: "Cairo, Egypt",
                    name: "Cairo Physiotherapy",
                    workinDays: "Sun / Tues / Thu / Sat",
                    workingHours: "10 AM - 10 PM",
                    rating: "4.6",
                    click: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PhysioCenterFormPage(
                                    name: 'Cairo Physiotherapy',
                                    about:
                                        'About the hospitalllldsfkbdf fffffffffffffffff ffffffffffffffffffffffffffffff ffffffffffffffffffffffffffffff f',
                                    address: 'Physiotherapy Center Address',
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
