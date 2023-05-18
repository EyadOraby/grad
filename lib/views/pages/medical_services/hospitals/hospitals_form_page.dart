import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/widgets/appointments_card.dart';
import 'package:grad/views/widgets/custom_date_picker.dart';
import 'package:grad/views/widgets/custom_time_picker.dart';
import 'package:grad/views/widgets/doctor_card.dart';
import 'package:grad/views/widgets/doctor_form_widget.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';
import 'package:grad/views/widgets/hospital_form_widget.dart';
import 'package:grad/views/widgets/ic_services_button.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../main.dart';
import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/services_button.dart';
import '../../../widgets/template.dart';

class HospitalsFormPage extends StatefulWidget {
  const HospitalsFormPage(
      {Key? key,
      required this.name,
      required this.about,
      required this.address,
      required this.workinDays,
      required this.workingHours})
      : super(key: key);

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

  static String? validateEmptyText(
      String text, String validationMessage, BuildContext context) {
    if (text.isEmpty) {
      return validationMessage;
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {}

  @override
  void dispose() {
    formNumberController.dispose();
    dateController.dispose();
    timeController.dispose();
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
