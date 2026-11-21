import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';
import 'package:grad/views/widgets/custom_text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nationalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  // late UserController _userController;
  // late final User user;

  bool obsecureText = true;
  final _formKey = GlobalKey<FormState>();

  void toggle() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  void validateInput() {
    if (nationalController.text.isEmpty) {
      setState(() {
        errorMessage = 'Input cannot be empty';
      });
    } else {
      // The prototype has no accounts backend yet, so any national ID
      // signs in and opens the home screen.
      setState(() => errorMessage = '');
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
    }
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Image(
                image: AssetImage('assets/new_logo_hq-removebg-preview.png'),
                height: 150,
                width: 270,
              ),
            ),
            Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
                        SanadColors.primary,
                        SanadColors.mint.withValues(alpha: 0.6)
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   width: 550,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.fromLTRB(
                                      //         20, 15, 20, 15),
                                      //     child: TextFormField(
                                      //         autovalidateMode: AutovalidateMode
                                      //             .onUserInteraction,
                                      //         obscureText: false,
                                      //         validator: (value) {
                                      //           if (value == '') {
                                      //             return 'Enter your National ID Number';
                                      //           }
                                      //           return null;
                                      //         },
                                      //         onEditingComplete: () {
                                      //           node.nextFocus();
                                      //         },
                                      //         controller: nationalController,
                                      //         textInputAction:
                                      //             TextInputAction.next,
                                      //         keyboardType:
                                      //             TextInputType.number,
                                      //         cursorColor: Colors.black,
                                      //         decoration: InputDecoration(
                                      //             border: OutlineInputBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                         Radius.circular(
                                      //                             15))),
                                      //             focusedBorder: OutlineInputBorder(
                                      //                 borderSide: BorderSide(
                                      //                     color: Colors.black),
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                         Radius.circular(
                                      //                             15))),
                                      //             hintText: 'National ID...')),
                                      //   ),
                                      // ),
                                      CustomTextField(
                                          deviceSize: deviceSize,
                                          width: 0.95,
                                          hintText: 'National ID...',
                                          controller: nationalController,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.number,
                                          obsecure: false,
                                          validator: (value) {
                                            if (value == '') {
                                              return 'Enter your National ID Number';
                                            }
                                            return null;
                                          },
                                          onEditingComplete: () {
                                            node.nextFocus();
                                          },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          cursorColor: Colors.black),
                                      // Container(
                                      //   width: 550,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.fromLTRB(
                                      //         20, 15, 20, 15),
                                      //     child: TextFormField(
                                      //         autovalidateMode: AutovalidateMode
                                      //             .onUserInteraction,
                                      //         obscureText: obsecureText,
                                      //         validator: (value) {
                                      //           if (value == '') {
                                      //             return 'Please Enter your Password';
                                      //           }
                                      //           return null;
                                      //         },
                                      //         onEditingComplete: () {
                                      //           node.unfocus();
                                      //         },
                                      //         controller: passwordController,
                                      //         textInputAction: TextInputAction
                                      //             .done,
                                      //         keyboardType: TextInputType
                                      //             .visiblePassword,
                                      //         cursorColor: Colors.black,
                                      //         decoration: InputDecoration(
                                      //             suffixIcon: IconButton(
                                      //               icon: Icon(
                                      //                 obsecureText
                                      //                     ? Icons
                                      //                         .visibility_rounded
                                      //                     : Icons
                                      //                         .visibility_off_rounded,
                                      //                 color: Colors.black,
                                      //               ),
                                      //               onPressed: () {
                                      //                 toggle();
                                      //               },
                                      //             ),
                                      //             border: OutlineInputBorder(
                                      //                 borderRadius: BorderRadius
                                      //                     .all(Radius.circular(
                                      //                         15))),
                                      //             focusedBorder:
                                      //                 OutlineInputBorder(
                                      //                     borderSide:
                                      //                         BorderSide(
                                      //                             color: Colors
                                      //                                 .black),
                                      //                     borderRadius:
                                      //                         BorderRadius.all(
                                      //                             Radius
                                      //                                 .circular(
                                      //                                     15))),
                                      //             hintText: 'Password...')),
                                      //   ),
                                      // )
                                      CustomTextField(
                                          deviceSize: deviceSize,
                                          width: 0.95,
                                          hintText: 'Password...',
                                          controller: passwordController,
                                          textInputAction: TextInputAction.done,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obsecure: obsecureText,
                                          validator: (value) {
                                            if (value == '') {
                                              return 'Please Enter your Password';
                                            }
                                            return null;
                                          },
                                          onEditingComplete: () {
                                            node.unfocus();
                                          },
                                          icon: IconButton(
                                            icon: Icon(
                                              obsecureText
                                                  ? Icons.visibility_rounded
                                                  : Icons
                                                      .visibility_off_rounded,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              toggle();
                                            },
                                          ),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          cursorColor: Colors.black)
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 8, 0, 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(162, 0, 0, 0),
                                      alignment: Alignment.bottomRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Handle click event
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  validateInput();
                                },
                                child: Container(
                                  height: 45,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: SanadColors.primary,
                                    borderRadius: BorderRadius.circular(15),
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
                                                Colors.black.withValues(alpha: 0.3),
                                          ),
                                        ],
                                        fontSize: 18,
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
                                    SizedBox(
                                      width: 125,
                                      child: Divider(
                                        color: Colors.black,
                                        height: 1,
                                        thickness: 0.7,
                                        indent: 5,
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
                                    SizedBox(
                                      width: 125,
                                      child: Divider(
                                        color: Colors.black,
                                        height: 1,
                                        thickness: 0.7,
                                        indent: 20,
                                        endIndent: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignUpPage()));
                                },
                                child: Container(
                                  height: 45,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
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
                                      'Sign Up',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: SanadColors.primary,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 1.0,
                                            color:
                                                Colors.black.withValues(alpha: 0.3),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
