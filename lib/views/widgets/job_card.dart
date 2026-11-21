
import 'package:flutter/material.dart';


class JobCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String image;

  final String location;
  final String jobTime;
  final String salary;
  final String applicants;
  final VoidCallback click;

  const JobCard({
    super.key,
    required this.location,
    required this.name,
    required this.applicants,
    required this.jobTime,
    required this.jobTitle,
    required this.image,
    required this.salary,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: SizedBox(
        width: deviceSize.width * 0.92,
        height: deviceSize.height * 0.35,
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
                      margin: EdgeInsets.all(20),
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage(image),
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: jobTitle,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
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
                                  text: name,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            alignment: Alignment.center,
                            image: AssetImage("assets/location-pin-icon.png"),
                            height: 18,
                            width: 18,
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.work_history_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: jobTime,
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
                          Icon(Icons.money),
                          SizedBox(
                            width: 10,
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: salary,
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
                              'Apply',
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
                        width: 35,
                      ),
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: applicants,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ])),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Applicants",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ])),
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 3),
                      //   child: Image(
                      //     alignment: Alignment.center,
                      //     image: AssetImage("assets/star-icon.png"),
                      //     height: 18,
                      //     width: 18,
                      //   ),
                      // ),
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
