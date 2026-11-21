import 'package:grad/theme/sanad_colors.dart';

import 'package:flutter/material.dart';
import 'package:grad/views/widgets/custom_date_picker.dart';
import 'package:grad/views/widgets/custom_time_picker.dart';


class HospitalFormWidget extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController? formNumberController;
  final String name;
  final String about;
  final String address;
  final String workinDays;
  final String workingHours;

  static String? validateEmptyText(
      String text, String validationMessage, BuildContext context) {
    if (text.isEmpty) {
      return validationMessage;
    }
    return null;
  }

  HospitalFormWidget({
    super.key,
    required this.name,
    required this.address,
    required this.about,
    required this.workinDays,
    required this.workingHours,
    required this.dateController,
    required this.timeController,
    this.formNumberController,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Card(
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            child: Container(
              width: deviceSize.width,
              color: SanadColors.primarySoft,
              child: Column(children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(
                  //     horizontal: 20, vertical: 30),
                  alignment: Alignment.center,
                  child: Text(
                    name,
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
                // Container(
                //   // margin: const EdgeInsets.symmetric(
                //   //     horizontal: 20, vertical: 10),
                //   alignment: Alignment.center,
                //   child: Text(
                //     specialization,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
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
                          "About: ",
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
                          // "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-",
                          about,
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
                          address,
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
                          workinDays,
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
                          workingHours,
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
                              //   activeBgColor: [SanadColors.primary],
                              //   activeFgColor: Colors.white,
                              //   inactiveBgColor:
                              //       Color.fromARGB(179, 207, 200, 200),
                              //   inactiveFgColor: SanadColors.ink,
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
                                  return validateEmptyText(dateController.text,
                                      "Please choose date", context);
                                },
                              ),
                              CustomTimePicker(
                                deviceSize: deviceSize,
                                title: "Time",
                                controller: timeController,
                                today: DateTime.now(),
                                width: 0.9,
                                validate: (_) {
                                  return validateEmptyText(timeController.text,
                                      "Please choose date", context);
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
                                      color: SanadColors.primaryDark,
                                      borderRadius: BorderRadius.circular(10),
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
    ));
  }
}
