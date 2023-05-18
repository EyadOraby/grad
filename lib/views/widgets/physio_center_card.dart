import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/medical_services/doctors/doctors_form_page.dart';

import '../pages/home_page.dart';

class PhysioCenterCard extends StatelessWidget {
  final String name;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;
  final VoidCallback click;

  const PhysioCenterCard({
    Key? key,
    required this.location,
    required this.name,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        width: deviceSize.width * 0.92,
        height: deviceSize.height * 0.3,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          shadowColor: Colors.black87,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromARGB(255, 139, 185, 111),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        // width: deviceSize.width * 0.25,
                        height: deviceSize.height * 0.12,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          elevation: 5,
                          shadowColor: Colors.black87,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color:
                                  // Color.fromARGB(255, 139, 185, 111),
                                  Color.fromARGB(255, 54, 122, 11),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Image(
                                        alignment: Alignment.center,
                                        image:
                                            AssetImage("assets/pyiso-icon.png"),
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image(
                                  alignment: Alignment.center,
                                  image: AssetImage(
                                      "assets/location-pin-icon.png"),
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ])),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // RichText(
                          //     textAlign: TextAlign.left,
                          //     text: TextSpan(children: [
                          //       TextSpan(
                          //         text: "Working Days",
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.w400,
                          //           fontSize: 17,
                          //         ),
                          //       ),
                          //     ])),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // RichText(
                          //     textAlign: TextAlign.left,
                          //     text: TextSpan(children: [
                          //       TextSpan(
                          //         text: "Working Hours",
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 19,
                          //         ),
                          //       ),
                          //     ])),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Image(
                              alignment: Alignment.center,
                              image: AssetImage("assets/calendar-icon.png"),
                              height: 18,
                              width: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: workinDays,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Image(
                              alignment: Alignment.center,
                              image: AssetImage("assets/clock-icon.png"),
                              height: 18,
                              width: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: workingHours,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: click,
                        child: Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.green.shade900,
                            borderRadius: BorderRadius.circular(10),
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
                              'Book',
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
                      SizedBox(
                        width: 115,
                      ),
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: rating,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                              ),
                            ),
                          ])),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/star-icon.png"),
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
