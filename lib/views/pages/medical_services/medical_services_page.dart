import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/doctors/doctors_page.dart';
import 'package:grad/views/pages/medical_services/hospitals/hospitals_page.dart';
import 'package:grad/views/pages/medical_services/radiology/radio_centers_page.dart';
import 'package:grad/views/pages/medical_services/physiotherapy/physio_centers_page.dart';

import 'package:grad/views/widgets/appointments_card.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import '../../widgets/template.dart';

class MedicalServicesPage extends StatefulWidget {
  const MedicalServicesPage({super.key});

  @override
  State<MedicalServicesPage> createState() => _MedicalServicesPageState();
}

class _MedicalServicesPageState extends State<MedicalServicesPage> {
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
      appBarTitle: 'SANAD',
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
                "Medical Services",
                textAlign: TextAlign.center,
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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
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
            // GovServicesButton(
            //   serviceTitle: "Apply for a new card",
            //   click: () {},
            //   serviceDescription:
            //       "Tap here if you want to apply for a new Integrated Services Card",
            //   // serviceImage: "",
            // ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MedicalCategoryServicesButton(
                        serviceTitle: "Doctors",
                        serviceImage: "assets/doctor-icon.png",
                        color: SanadColors.primary,
                        click: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DoctorsPage()));
                        }),
                    MedicalCategoryServicesButton(
                        serviceTitle: "Hospitals ",
                        serviceImage: "assets/hospital-icon.png",
                        color: SanadColors.primarySoft,
                        click: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HospitalsPage()));
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MedicalCategoryServicesButton(
                        serviceTitle: "Radiology \nCenters",
                        serviceImage: "assets/medical-scan-icon.png",
                        color: SanadColors.primarySoft,
                        click: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RadioCentersPage()));
                        }),
                    MedicalCategoryServicesButton(
                        serviceTitle: "Physiotherapy \nCenters",
                        serviceImage: "assets/pyiso-icon.png",
                        color: SanadColors.primary,
                        click: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PhysioCentersPage()));
                        }),
                  ],
                ),
              ],
            ),

            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Card Renewal Applications",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // GovServicesButton(
            //   serviceTitle: "Renew your old card",
            //   click: () {},
            //   serviceDescription:
            //       'Tap here if you want to renew your old Integrated Services Card',
            // ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Upcoming Appointments",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppointmentsCard(
              dateNum: "12",
              dateText: "Tue",
              description: "Neurology",
              name: "Dr. Mohamed Abdallah",
              time: "09:30 AM",
            ),
            AppointmentsCard(
              dateNum: "24",
              dateText: "Wed",
              description: "Ophthalmology",
              name: "Dr. Aly Omar",
              time: "12:30 AM",
            ),
            AppointmentsCard(
              dateNum: "05",
              dateText: "Sun",
              description: "Orthopedics",
              name: "Dr. Alaa Amr",
              time: "04:00 PM",
            ),
            // Container(
            //   width: deviceSize.width * 0.92,
            //   height: deviceSize.height * 0.18,
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(20))),
            //     elevation: 5,
            //     shadowColor: Colors.black87,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         color: SanadColors.primarySoft,
            //       ),
            //       child: Row(
            //         children: [
            //           Container(
            //               margin: EdgeInsets.all(8),
            //               width: deviceSize.width * 0.25,
            //               height: deviceSize.height * 0.281,
            //               child: Card(
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20))),
            //                 elevation: 5,
            //                 shadowColor: Colors.black87,
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20.0),
            //                     color: SanadColors.primaryDark,
            //                   ),
            //                   child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: [
            //                         RichText(
            //                             textAlign: TextAlign.left,
            //                             text: TextSpan(children: [
            //                               TextSpan(
            //                                 text: "12",
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontWeight: FontWeight.bold,
            //                                   fontSize: 26,
            //                                 ),
            //                               ),
            //                             ])),
            //                         SizedBox(
            //                           height: 5,
            //                         ),
            //                         RichText(
            //                             textAlign: TextAlign.left,
            //                             text: TextSpan(children: [
            //                               TextSpan(
            //                                 text: "Tue",
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontWeight: FontWeight.bold,
            //                                   fontSize: 22,
            //                                 ),
            //                               ),
            //                             ])),
            //                       ]),
            //                 ),
            //               )),
            //           SizedBox(
            //             width: 5,
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 RichText(
            //                     textAlign: TextAlign.left,
            //                     text: TextSpan(children: [
            //                       TextSpan(
            //                         text: "09:30 AM",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 17,
            //                         ),
            //                       ),
            //                     ])),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 RichText(
            //                     textAlign: TextAlign.left,
            //                     text: TextSpan(children: [
            //                       TextSpan(
            //                         text: "Dr. Mohamed Abdallah",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 19,
            //                         ),
            //                       ),
            //                     ])),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 RichText(
            //                     textAlign: TextAlign.left,
            //                     text: TextSpan(children: [
            //                       TextSpan(
            //                         text: "Neurology",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 17,
            //                         ),
            //                       ),
            //                     ])),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
            // GovServicesButton(
            //     serviceTitle: "Follow up your \npending application",
            //     click: () {},
            //     serviceDescription:
            //         'Tap here to enter your application number to know the status of your application'),
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
