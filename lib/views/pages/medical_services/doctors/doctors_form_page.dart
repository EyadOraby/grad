import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/doctor_form_widget.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class DoctorsFormPage extends StatefulWidget {
  const DoctorsFormPage({super.key});

  @override
  State<DoctorsFormPage> createState() => _DoctorsFormPageState();
}

class _DoctorsFormPageState extends State<DoctorsFormPage> {
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
      body: DoctorFormWidget(
        name: "Dr. Aly Ahmed",
        specialization: context.t("Osteopaths"),
        about:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-",
        address: "El-Gabal El-Akhdar Bldgs. 17, Nasr City",
        workinDays: context.t("Sunday - Wednesday"),
        workingHours: "02:00 - 07:00 PM",
        dateController: dateController,
        timeController: timeController,
      ),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
