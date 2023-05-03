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
import 'package:grad/views/widgets/ic_services_button.dart';
import 'package:grad/views/widgets/medical_cat_services_button.dart';

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

  TextEditingController formNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {}

  @override
  void dispose() {
    formNumberController.dispose();
    nameController.dispose();
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
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Appointment Form",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                  deviceSize: deviceSize,
                                  width: 0.7,
                                  hintText: "Name",
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  obsecure: false,
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Enter your Name';
                                    }
                                    return null;
                                  },
                                  onEditingComplete: () {
                                    node.nextFocus();
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  cursorColor: Colors.black),
                            ],
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
