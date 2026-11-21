import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/job_card.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import '../../widgets/template.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  TextEditingController formNumberController = TextEditingController();

  @override
  void dispose() {
    formNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
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
                context.t("Jobs Services"),
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
                context.t(
                    "Hi Aly, these are Jobs near you, and suitable for your condition."),
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
                  jobTime: context.t("Full Time"),
                  applicants: "12",
                  salary: "5.5K" "/Month",
                  click: () {},
                  image: 'assets/ON_logo.png',
                ),
                JobCard(
                  location: "Giza, Egypt",
                  name: "Orange",
                  jobTitle: "Data Entry",
                  jobTime: context.t("Part Time"),
                  applicants: "19",
                  salary: "3K" "/Month",
                  click: () {},
                  image: 'assets/Orange_Logo_new.jpg',
                ),
                JobCard(
                  location: "Cairo, Egypt",
                  name: "Pepsi",
                  jobTitle: "Office Assistant",
                  jobTime: context.t("Part Time"),
                  applicants: "12",
                  salary: "4.5K" "/Month",
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
