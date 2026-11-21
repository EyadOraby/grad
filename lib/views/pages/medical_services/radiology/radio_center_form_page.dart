import 'package:grad/l10n/sanad_strings.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/radio_center_form_widget.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class RadioCenterFormPage extends StatefulWidget {
  const RadioCenterFormPage(
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
  State<RadioCenterFormPage> createState() => _RadioCenterFormPageState();
}

class _RadioCenterFormPageState extends State<RadioCenterFormPage> {
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
      appBarTitle: context.t('SANAD'),
      index: 2,
      body: RadioCenterFormWidget(
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
