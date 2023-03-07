import 'dart:async';
import 'package:automobile_doctor/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splashScr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutomobileDoctor',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
