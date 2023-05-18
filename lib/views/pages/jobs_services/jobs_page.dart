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
import 'package:grad/views/widgets/job_card.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';
import 'package:grad/views/widgets/radio_center_card.dart';

import '../../../main.dart';
import '../../widgets/bottom_nav_bar_widget.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/services_button.dart';
import '../../widgets/template.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
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
      index: 3,
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
                "Jobs Services",
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
                "Hi.. Aly, these are Jobs near you, and suitable for your condition.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                JobCard(
                  location: "Giza, Egypt",
                  name: "ON",
                  jobTitle: "Content Writer",
                  jobTime: "Full Time",
                  applicants: "12",
                  salary: "5.5K" + "/Month",
                  click: () {},
                  image: 'assets/ON_logo.png',
                ),
                JobCard(
                  location: "Giza, Egypt",
                  name: "Orange",
                  jobTitle: "Data Entry",
                  jobTime: "Part Time",
                  applicants: "19",
                  salary: "3K" + "/Month",
                  click: () {},
                  image: 'assets/Orange_Logo_new.jpg',
                ),
                JobCard(
                  location: "Cairo, Egypt",
                  name: "Pepsi",
                  jobTitle: "Office Assistant",
                  jobTime: "Part Time",
                  applicants: "12",
                  salary: "4.5K" + "/Month",
                  click: () {},
                  image: 'assets/pepsi-logo.png',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 3,
      ),
    );
  }
}
