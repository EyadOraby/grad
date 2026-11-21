
import 'package:flutter/material.dart';


class GovServicesButton extends StatelessWidget {
  final String serviceTitle;
  final String serviceImage;
  final String? serviceDescription;
  final Color color;

  final VoidCallback click;
  const GovServicesButton({
    super.key,
    required this.serviceTitle,
    required this.serviceImage,
    required this.click,
    required this.color,
    this.serviceDescription,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        shadowColor: Colors.black87,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color.fromRGBO(94, 216, 147, 1),
              //     Color.fromRGBO(55, 131, 88, 1),
              //   ],
              // ),
              color: color
              //  Color.fromARGB(255, 139, 185, 111)
              ),
          child: InkWell(
            onTap: click,
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
                              text: serviceTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: deviceSize.width * 0.8,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: serviceDescription,
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
                      Image(
                        alignment: Alignment.center,
                        image: AssetImage(serviceImage),
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // InkWell(
    //   child: Padding(
    //     padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
    //     child: Card(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(20))),
    //       elevation: 15,
    //       shadowColor: Colors.black87,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20.0),
    //           color: Color.fromARGB(255, 139, 185, 111),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               RichText(
    //                   textAlign: TextAlign.center,
    //                   text: TextSpan(children: [
    //                     TextSpan(
    //                       text: serviceTitle,
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 26),
    //                     ),
    //                   ])),
    //               const SizedBox(
    //                 height: 15,
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
