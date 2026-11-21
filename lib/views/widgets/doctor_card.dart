
import 'package:flutter/material.dart';


class DoctorCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String specialization;
  final String location;
  final String workinDays;
  final String workingHours;
  final String rating;
  final String? gender;
  final VoidCallback click;

  const DoctorCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.specialization,
    required this.location,
    required this.workinDays,
    required this.workingHours,
    required this.rating,
    required this.click,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 10),
      child: SizedBox(
        width: deviceSize.width * 0.46,
        height: deviceSize.height * 0.39,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          shadowColor: Colors.black87,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 139, 185, 111)),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      alignment: Alignment.center,
                      image: gender == "Male"
                          ? AssetImage("assets/doctor-icon.png")
                          : AssetImage("assets/female-doctor-icon.png"),
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Dr. $firstName\n$lastName",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 1,
                    ),
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text: specialization,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            alignment: Alignment.center,
                            image: AssetImage("assets/location-pin-icon.png"),
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: location,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            alignment: Alignment.center,
                            image: AssetImage("assets/calendar-icon.png"),
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: workinDays,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            alignment: Alignment.center,
                            image: AssetImage("assets/clock-icon.png"),
                            height: 18,
                            width: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: workingHours,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ])),
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

                            // () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (_) => DoctorsFormPage()));
                            // },
                            child: Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                color: Colors.green.shade900,
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
                                  'Book',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: rating,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
