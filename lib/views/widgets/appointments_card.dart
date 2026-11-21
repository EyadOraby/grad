import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';

class AppointmentsCard extends StatelessWidget {
  final String dateNum;
  final String dateText;
  final String time;
  final String name;
  final String description;

  const AppointmentsCard({
    super.key,
    required this.dateNum,
    required this.dateText,
    required this.description,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: SizedBox(
        width: deviceSize.width * 0.92,
        height: deviceSize.height * 0.18,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          shadowColor: Colors.black87,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: SanadColors.primarySoft,
            ),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    width: deviceSize.width * 0.25,
                    height: deviceSize.height * 0.281,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 5,
                      shadowColor: Colors.black87,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: SanadColors.primaryDark,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: dateNum,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ])),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: dateText,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ])),
                            ]),
                      ),
                    )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: time,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: description,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ])),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
