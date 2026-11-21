import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/hospital_form_widget.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class HospitalsFormPage extends StatefulWidget {
  const HospitalsFormPage(
      {super.key,
      required this.name,
      required this.about,
      required this.address,
      required this.workinDays,
      required this.workingHours});

  final String name;
  final String about;
  final String address;
  final String workinDays;
  final String workingHours;

  @override
  State<HospitalsFormPage> createState() => _HospitalsFormPageState();
}

class _HospitalsFormPageState extends State<HospitalsFormPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController formNumberController = TextEditingController();

  @override
  void dispose() {
    formNumberController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
      index: 2,
      body: HospitalFormWidget(
        name: widget.name,
        about: widget.about,
        address: widget.address,
        workinDays: widget.workinDays,
        workingHours: widget.workingHours,
        dateController: dateController,
        timeController: timeController,
      ),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
