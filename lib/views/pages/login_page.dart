import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/widgets/form_text_field_widget.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nationalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              'Sign In',
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          65, 15, 65, 15),
                                      child: CustomTextField(
                                        deviceSize: deviceSize,
                                        width: 0.85,
                                        name: "National ID Number..",
                                        controller: nationalController,
                                        keyboardType: TextInputType.number,
                                        obsecure: obsecureText,
                                        textInputAction: TextInputAction.next,
                                        icon: IconButton(
                                          icon: Icon(obsecureText
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded),
                                          onPressed: () {
                                            toggle();
                                          },
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == '') {
                                            return 'Please Enter your Password';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () {
                                          node.nextFocus();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          65, 15, 65, 15),
                                      child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) {
                                            if (value == '') {
                                              return 'Please Enter your Password';
                                            }
                                            return null;
                                          },
                                          controller: passwordController,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              hintText: 'Password...')),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 25, 30),
                              child: Container(
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
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            InkWell(
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
                                          color: Colors.black.withOpacity(0.3),
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
                                children: [
                                  Expanded(
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
                                  Expanded(
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
