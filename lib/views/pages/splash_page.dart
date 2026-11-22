import 'package:material_ui/material_ui.dart';
import 'package:grad/views/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

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
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false);
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
                'new_logo_hq-removebg-preview.png',
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
