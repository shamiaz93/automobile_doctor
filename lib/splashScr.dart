import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'landingScreen.dart';

class SplashScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: LandingScreen(),
      title: const Text('We serve you at your choice of location',
          textScaleFactor: 1),
      image: Image.asset('assets/images/autodoc.png'),
      loadingText: const Text("...."),
      photoSize: 100.0,
      loaderColor: Colors.grey,
    );
  }
}
