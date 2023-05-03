import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';
import 'package:grad/views/widgets/ic_services_button.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';

class IDServicesPage extends StatefulWidget {
  const IDServicesPage({Key? key}) : super(key: key);

  @override
  State<IDServicesPage> createState() => _IDServicesPageState();
}

class _IDServicesPageState extends State<IDServicesPage> {
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
                "National ID Card \nApplications",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 129, 62),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  // decoration: TextDecoration.underline,
                  // decorationStyle: TextDecorationStyle.solid,
                  // decorationColor: Color.fromRGBO(139, 185, 111, 0.8),
                  // decorationThickness: 2.0
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Renew your old National ID Card from here:",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                  child: Container(
                    width: deviceSize.width * 0.9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 5,
                      shadowColor: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromARGB(255, 139, 185, 111)),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text:
                                                "National ID Card Renewal Application",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      // width: deviceSize.width * 0.3,
                                      child: Image(
                                        alignment: Alignment.center,
                                        image:
                                            AssetImage("assets/renew-card.png"),
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Pending Applications",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                      color: Color.fromARGB(255, 139, 185, 111)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
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
                            Container(
                              width: deviceSize.width * 0.8,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "Enter your application number to know the status of your application",
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
                                            hintText:
                                                'Enter your form number here',
                                            controller: formNumberController,
                                            textInputAction:
                                                TextInputAction.done,
                                            keyboardType: TextInputType.number,
                                            obsecure: false,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Enter your form number';
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
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(0, -2),
                                        blurRadius: 8,
                                        blurStyle: BlurStyle.inner,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(0, -2),
                                        blurRadius: 8,
                                        blurStyle: BlurStyle.inner,
                                        spreadRadius: 1),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Check',
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.green,
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
                        ),
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
