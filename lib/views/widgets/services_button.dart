import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/gov_services_page.dart';

import '../pages/home_page.dart';

class ServicesButton extends StatelessWidget {
  final String serviceTitle;
  final String? serviceImage;
  final String? serviceDescription;

  final VoidCallback click;

  const ServicesButton(
      {Key? key,
      required this.serviceTitle,
      this.serviceImage,
      required this.click,
      required this.serviceDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        shadowColor: Colors.black87,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(94, 216, 147, 1),
                Color.fromRGBO(55, 131, 88, 1),
              ],
            ),
          ),
          child: InkWell(
            onTap: click,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    alignment: Alignment.topLeft,
                    image: AssetImage(serviceImage!),
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                              text: serviceTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ])),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: deviceSize.width * 0.5,
                        child: RichText(
                            textAlign: TextAlign.left,
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
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
