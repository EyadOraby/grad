import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  final formKey = GlobalKey<FormState>();

  @override
  // void initState() {
  //   _userController = UserController(this);
  //   _userController.getUsers();
  //   super.initState();
  // }

  @override
  // void dispose() {
  //   _userController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/sparkLogo-.png'),
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'SANAD',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 15, 65, 15),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == '') {
                                return 'Please Enter your National ID Number';
                              }
                              return null;
                            },
                            controller: nationalController,
                            //keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                hintText: 'National ID Number...')),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 15, 65, 15),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == '') {
                                return 'Please Enter your Password';
                              }
                              return null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                hintText: 'Password...')),
                      )
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(65, 15, 65, 15),
                    child: ElevatedButton(
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          //   _userController.onClickAction(
                          //       email: nationalController);
                          // }
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => HomePage()),
                              (route) => false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Sign In',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        )),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
