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
import 'package:grad/views/widgets/ic_services_button.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../main.dart';
import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/services_button.dart';
import '../../../widgets/template.dart';

class DoctorsFormPage extends StatefulWidget {
  const DoctorsFormPage({Key? key}) : super(key: key);

  @override
  State<DoctorsFormPage> createState() => _DoctorsFormPageState();
}

class _DoctorsFormPageState extends State<DoctorsFormPage> {
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
      body: DoctorFormWidget(
        name: "Dr. Aly Ahmed",
        specialization: "Osteopaths",
        about:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-",
        address: "El-Gabal El-Akhdar Bldgs. 17, Nasr City",
        workinDays: "Sunday - Wednesday",
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
