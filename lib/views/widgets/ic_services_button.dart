
import 'package:flutter/material.dart';


class ICServicesButton extends StatelessWidget {
  final String serviceTitle;
  final String serviceImage;
  final VoidCallback click;

  const ICServicesButton({
    super.key,
    required this.serviceTitle,
    required this.serviceImage,
    required this.click,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
      child: SizedBox(
        width: deviceSize.width * 0.43,
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
                color: Color.fromARGB(255, 139, 185, 111)),
            child: InkWell(
              onTap: click,
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
                                text: serviceTitle,
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
                        Image(
                          alignment: Alignment.center,
                          image: AssetImage(serviceImage),
                          height: 80,
                          width: 80,
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
