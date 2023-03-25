import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/login_page.dart';
import 'package:grad/views/widgets/custom_text_field.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nationalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController re_passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  // late UserController _userController;
  // late final User user;

  bool obsecureText = true;
  final _formKey = GlobalKey<FormState>();

  void toggle() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  // void initState() {
  //   _userController = UserController(this);
  //   _userController.getUsers();
  //   super.initState();
  // }

  @override
  void dispose() {
    //_userController.dispose();
    nationalController.dispose();
    passwordController.dispose();
    emailController.dispose();
    re_passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('new_logo_hq-removebg-preview.png'),
              height: 150,
              width: 300,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black,
                margin: EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(55, 131, 88, 1),
                        Color.fromRGBO(94, 216, 147, 0.6)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       65, 15, 65, 15),
                                    //   child: CustomTextField(
                                    //     name: "National ID Number..",
                                    //     controller: nationalController,
                                    //     keyboardType: TextInputType.number,
                                    //     obsecure: obsecureText,
                                    //     textInputAction: TextInputAction.next,
                                    //     icon: IconButton(
                                    //       icon: Icon(obsecureText
                                    //           ? Icons.visibility_rounded
                                    //           : Icons.visibility_off_rounded),
                                    //       onPressed: () {
                                    //         toggle();
                                    //       },
                                    //     ),
                                    //     autovalidateMode:
                                    //         AutovalidateMode.onUserInteraction,
                                    //     validator: (value) {
                                    //       if (value == '') {
                                    //         return 'Please Enter your Password';
                                    //       }
                                    //       return null;
                                    //     },
                                    //     onEditingComplete: () {
                                    //       node.nextFocus();
                                    //     },
                                    //     deviceSize: deviceSize,
                                    //     errorMessage: errorMessage,
                                    //   ),
                                    // ),
                                    Container(
                                      width: 550,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            65, 15, 65, 15),
                                        child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            obscureText: false,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Enter your National ID Number';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              node.nextFocus();
                                            },
                                            controller: nationalController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                                // suffixIcon: IconButton(
                                                //   icon: Icon(
                                                //     obsecureText
                                                //         ? Icons
                                                //             .visibility_rounded
                                                //         : Icons
                                                //             .visibility_off_rounded,
                                                //     color: Colors.black,
                                                //   ),
                                                //   onPressed: () {
                                                //     toggle();
                                                //   },
                                                // ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                hintText: 'National ID...')),
                                      ),
                                    ),
                                    Container(
                                      width: 550,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            65, 15, 65, 15),
                                        child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            obscureText: obsecureText,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Please Enter your Password';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              node.unfocus();
                                            },
                                            controller: passwordController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    obsecureText
                                                        ? Icons
                                                            .visibility_rounded
                                                        : Icons
                                                            .visibility_off_rounded,
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    toggle();
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                hintText: 'Password...')),
                                      ),
                                    ),
                                    Container(
                                      width: 550,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            65, 15, 65, 15),
                                        child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            obscureText: obsecureText,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Please Enter Matching Password ';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              node.unfocus();
                                            },
                                            controller: re_passwordController,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    obsecureText
                                                        ? Icons
                                                            .visibility_rounded
                                                        : Icons
                                                            .visibility_off_rounded,
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {
                                                    toggle();
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                hintText:
                                                    'Re-Enter Password...')),
                                      ),
                                    ),
                                    Container(
                                      width: 550,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            65, 15, 65, 15),
                                        child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            obscureText: false,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Please Enter your Email';
                                              }
                                              return null;
                                            },
                                            onEditingComplete: () {
                                              node.unfocus();
                                            },
                                            controller: emailController,
                                            textInputAction:
                                                TextInputAction.done,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                                // suffixIcon: IconButton(
                                                //   icon: Icon(
                                                //     obsecureText
                                                //         ? Icons
                                                //             .visibility_rounded
                                                //         : Icons
                                                //             .visibility_off_rounded,
                                                //     color: Colors.black,
                                                //   ),
                                                //   onPressed: () {
                                                //     toggle();
                                                //   },
                                                // ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                hintText: 'Email...')),
                                      ),
                                    )
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       65, 15, 65, 15),
                                    //   child: CustomTextField(
                                    //     deviceSize: deviceSize,
                                    //     width: 0.85,
                                    //     name: "Password..",
                                    //     controller: passwordController,
                                    //     keyboardType: TextInputType.number,
                                    //     obsecure: obsecureText,
                                    //     textInputAction: TextInputAction.done,
                                    //     icon: IconButton(
                                    //       icon: Icon(obsecureText
                                    //           ? Icons.visibility_rounded
                                    //           : Icons.visibility_off_rounded),
                                    //       onPressed: () {
                                    //         toggle();
                                    //       },
                                    //     ),
                                    //     autovalidateMode:
                                    //         AutovalidateMode.onUserInteraction,
                                    //     validator: (value) {
                                    //       if (value == '') {
                                    //         return 'Please Enter your Password';
                                    //       }
                                    //       return null;
                                    //     },
                                    //     onEditingComplete: () {
                                    //       node.unfocus();
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                )),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(10, 8, 25, 30),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                            //         alignment: Alignment.bottomRight,
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             // Handle click event
                            //           },
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(
                            //               'Forgot Password?',
                            //               style: TextStyle(
                            //                 decoration:
                            //                     TextDecoration.underline,
                            //                 fontSize: 17,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //         child: Padding(
                            //       padding:
                            //           const EdgeInsets.fromLTRB(65, 15, 65, 15),
                            //       child: OutlinedButton(
                            //           onPressed: () {
                            //             // if (formKey.currentState!.validate()) {
                            //             //   _userController.onClickAction(
                            //             //       email: nationalController);
                            //             // }
                            //             Navigator.pushAndRemoveUntil(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (_) => HomePage()),
                            //                 (route) => false);
                            //           },
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(10.0),
                            //             child: Text('Sign In',
                            //                 style: TextStyle(
                            //                     fontSize: 18,
                            //                     fontWeight: FontWeight.bold)),
                            //           )),
                            //     ))
                            //   ],
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginPage()));
                                },
                                child: Container(
                                  height: 40,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
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
                                      'Sign In',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 1.0,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                        ],
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 195,
                                    child: Divider(
                                      color: Colors.black,
                                      height: 1,
                                      thickness: 0.7,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      'Or',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 195,
                                    child: Divider(
                                      color: Colors.black,
                                      height: 1,
                                      thickness: 0.7,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
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
                                    'Sign Up',
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 1.0,
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
