import 'package:automobile_doctor/landingScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/autodoc.png'),
      logoWidth: 90,
      title: Text(
        "We serve you at your choice of location",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("..."),
      navigator: LandingScreen(),
      durationInSeconds: 5,
    );
  }
}
