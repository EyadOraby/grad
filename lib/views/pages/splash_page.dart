import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/home_page.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      // if (AppConfigService.appUser != null) {
      //   Navigator.pushAndRemoveUntil(context,
      //       MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      // } else {
      //   Navigator.pushAndRemoveUntil(context,
      //       MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      // }
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/sparkLogo-.png',
              ),
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
