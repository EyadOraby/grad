import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/gov_services/IC_services/new_IC_form_page.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/ic_services_button.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/template.dart';

class ICServicesPage extends StatefulWidget {
  const ICServicesPage({super.key});

  @override
  State<ICServicesPage> createState() => _ICServicesPageState();
}

class _ICServicesPageState extends State<ICServicesPage> {
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
      index: 0,
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
                "Integrated Services Card \nApplications",
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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                context
                    .t("Apply for a new card or renew your old one from here:"),
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
            //   serviceTitle: context.t("Apply for a new card"),
            //   click: () {},
            //   serviceDescription:
            //       "Tap here if you want to apply for a new Integrated Services Card",
            //   // serviceImage: "",
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ICServicesButton(
                    serviceTitle: context.t("New Card"),
                    serviceImage: "assets/new-card.png",
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => NewICFormPage()));
                    }),
                ICServicesButton(
                    serviceTitle: context.t("Renew "),
                    serviceImage: "assets/renew-card.png",
                    click: () {}),
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
            //   serviceTitle: context.t("Renew your old card"),
            //   click: () {},
            //   serviceDescription:
            //       'Tap here if you want to renew your old Integrated Services Card',
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                context.t("Pending Applications"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // GovServicesButton(
            //     serviceTitle: "Follow up your \npending application",
            //     click: () {},
            //     serviceDescription:
            //         'Tap here to enter your application number to know the status of your application'),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 14, 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                shadowColor: Colors.black87,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: SanadColors.primarySoft),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        "Follow up your \npending application",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ])),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: context.t(
                                          "Enter your application number to know the status of your application"),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.5,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ])),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                            deviceSize: deviceSize,
                                            width: 0.8,
                                            hintText: context.t(
                                                'Enter your form number here'),
                                            controller: formNumberController,
                                            textInputAction:
                                                TextInputAction.done,
                                            keyboardType: TextInputType.number,
                                            obsecure: false,
                                            validator: (value) {
                                              if (value == '') {
                                                return context.t(
                                                    'Enter your form number');
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              node.unfocus();
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            cursorColor: Colors.black),
                                      ],
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 45,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Colors.black.withValues(alpha: 0.3),
                                        offset: Offset(0, -2),
                                        blurRadius: 8,
                                        blurStyle: BlurStyle.inner,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color:
                                            Colors.black.withValues(alpha: 0.3),
                                        offset: Offset(0, -2),
                                        blurRadius: 8,
                                        blurStyle: BlurStyle.inner,
                                        spreadRadius: 1),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    context.t('Check'),
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: SanadColors.primary,
                                      fontWeight: FontWeight.bold,
                                      // shadows: [
                                      //   Shadow(
                                      //     offset: Offset(1, 1),
                                      //     blurRadius: 1.0,
                                      //     color: Colors.black.withOpacity(0.3),
                                      //   ),
                                      // ],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        // Image(
                        //   alignment: Alignment.center,
                        //   image: AssetImage(serviceImage!),
                        //   height: 120,
                        //   width: 115,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
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
