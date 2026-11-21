import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services/IC_services/IC_services_page.dart';
import 'package:grad/views/pages/gov_services/ID_services/ID_Renew_services_page.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import '../../widgets/template.dart';

class GovServicesPage extends StatefulWidget {
  const GovServicesPage({super.key});

  @override
  State<GovServicesPage> createState() => _GovServicesPageState();
}

class _GovServicesPageState extends State<GovServicesPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: 'SANAD',
      index: 1,
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
                "Governmental Services",
                style: TextStyle(
                  color: SanadColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  // decoration: TextDecoration.underline,
                  // decorationStyle: TextDecorationStyle.solid,
                  // decorationColor: SanadColors.primarySoft,
                  // decorationThickness: 2.0
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Apply for a Card if you still haven't!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Column(
              children: [
                GovServicesButton(
                  serviceTitle: "Integrated Services \nCard Applications",
                  click: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ICServicesPage()));
                  },
                  serviceDescription:
                      'New card and renewal applications \nFollow up requests',
                  serviceImage: "assets/applications.png",
                  color: SanadColors.primarySoft,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Other services:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GovServicesButton(
                  serviceTitle: "National ID Card \nRenewal",
                  click: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => IDServicesPage()));
                  },
                  serviceDescription:
                      'National ID Card renewal applications \nFollow up requests',
                  serviceImage: "assets/id-icon.png",
                  color: SanadColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 1,
      ),
    );
  }
}
