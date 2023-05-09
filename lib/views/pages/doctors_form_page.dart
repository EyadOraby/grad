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
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';
import 'package:grad/views/widgets/ic_services_button.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';

class DoctorsFormPage extends StatefulWidget {
  const DoctorsFormPage({Key? key}) : super(key: key);

  @override
  State<DoctorsFormPage> createState() => _DoctorsFormPageState();
}

class _DoctorsFormPageState extends State<DoctorsFormPage> {
  TextEditingController nameController = TextEditingController();
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
    nameController.dispose();
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
      body: SingleChildScrollView(
          child: Card(
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              child: Container(
                width: deviceSize.width,
                color: Color.fromARGB(255, 139, 185, 111),
                child: Column(children: [
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      "Dr. Aly Ahmed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "Osteopaths",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/call-icon.png"),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/chat-icon.png"),
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/whatsapp-icon.png"),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About Doctor: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Address: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "El-Gabal El-Akhdar Bldgs. 17, Nasr City",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Working Days: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Sunday - Wednesday",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Working Hours: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "02:00 - 07:00 PM",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                      width: deviceSize.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.grey.shade100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Book an Appointment Now!!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // CustomTextField(
                                //     deviceSize: deviceSize,
                                //     width: 0.7,
                                //     hintText: "Name",
                                //     controller: nameController,
                                //     textInputAction: TextInputAction.next,
                                //     keyboardType: TextInputType.text,
                                //     obsecure: false,
                                //     validator: (value) {
                                //       if (value == '') {
                                //         return 'Enter your Name';
                                //       }
                                //       return null;
                                //     },
                                //     onEditingComplete: () {
                                //       node.nextFocus();
                                //     },
                                //     autovalidateMode:
                                //         AutovalidateMode.onUserInteraction,
                                //     cursorColor: Colors.black),
                                // ToggleSwitch(
                                //   minWidth: 90.0,
                                //   minHeight: 60.0,
                                //   fontSize: 16.0,
                                //   initialLabelIndex: 1,
                                //   activeBgColor: [Colors.green],
                                //   activeFgColor: Colors.white,
                                //   inactiveBgColor:
                                //       Color.fromARGB(179, 207, 200, 200),
                                //   inactiveFgColor: Colors.grey[900],
                                //   totalSwitches: 3,
                                //   labels: ['Tall', 'Grande', 'Venti'],
                                //   onToggle: (index) {
                                //     print('switched to: $index');
                                //   },
                                // ),
                                CustomDatePicker(
                                  deviceSize: deviceSize,
                                  controller: dateController,
                                  initialDate: DateTime.now(),
                                  title: "Date",
                                  validate: (_) {
                                    return validateEmptyText(
                                        dateController.text,
                                        "Please choose date",
                                        context);
                                  },
                                ),
                                CustomTimePicker(
                                  deviceSize: deviceSize,
                                  title: "Time",
                                  controller: timeController,
                                  today: DateTime.now(),
                                  width: 0.9,
                                  validate: (_) {
                                    return validateEmptyText(
                                        timeController.text,
                                        "Please choose date",
                                        context);
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 5, 50, 20),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (_) =>
                                      //             DoctorsFormPage()));
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade900,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: Offset(0, -2),
                                              blurRadius: 8,
                                              blurStyle: BlurStyle.inner,
                                              spreadRadius: 1),
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: Offset(0, -2),
                                              blurRadius: 8,
                                              blurStyle: BlurStyle.inner,
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Appointment',
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      )),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
