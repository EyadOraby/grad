import 'package:grad/views/widgets/booking_sheet.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/widgets/custom_date_picker.dart';
import 'package:grad/views/widgets/custom_modal_list.dart';
import 'package:grad/views/widgets/custom_time_picker.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';
import 'package:grad/views/widgets/read_only_text_field.dart';

import '../../../widgets/bottom_nav_bar_widget.dart';
import '../../../widgets/template.dart';

class NewICFormPage extends StatefulWidget {
  const NewICFormPage({super.key});

  @override
  State<NewICFormPage> createState() => _NewICFormPageState();
}

class _NewICFormPageState extends State<NewICFormPage> {
  TextEditingController formNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController socialStatusController = TextEditingController();

  static String? validateEmptyText(
      String text, String validationMessage, BuildContext context) {
    if (text.isEmpty) {
      return validationMessage;
    }
    return null;
  }

  int socialStatusesIndex = 0;

  static const List<String> socialStatuses = [
    'Married',
    'Unmarried',
    'Divorced',
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    formNumberController.dispose();
    dateController.dispose();
    timeController.dispose();
    socialStatusController.dispose();

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
                "New Integrated Card Form",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SanadColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Hi Aly, these are Radiology Centers near you, which provide medical services for your condition.",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Column(
              children: [
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Scoial Status:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ReadOnlyTextFiled(
                          controller: socialStatusController,
                          validate: (_) {
                            return validateEmptyText(
                                socialStatusController.text,
                                "Please choose social status",
                                context);
                          },
                          label: "Choose Scoical Status",
                          onTap: () {
                            customListModalSheet(context, (index) {
                              socialStatusController.text =
                                  socialStatuses[index];
                              socialStatusesIndex = index;
                            }, socialStatusesIndex, socialStatuses,
                                "Choose your Scoical Status");
                          }),

                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date of Medical Check-Up Visit:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Time of Medical Check-Up Visit:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTimePicker(
                        deviceSize: deviceSize,
                        title: "Time",
                        controller: timeController,
                        today: DateTime.now(),
                        width: 0.9,
                        validate: (_) {
                          return validateEmptyText(timeController.text,
                              "Please choose time", context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 5, 50, 20),
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? true) {
                              submitServiceRequest(context, service: 'Integrated services card');
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                              color: SanadColors.primaryDark,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    offset: Offset(0, -2),
                                    blurRadius: 8,
                                    blurStyle: BlurStyle.inner,
                                    spreadRadius: 1),
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
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
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
