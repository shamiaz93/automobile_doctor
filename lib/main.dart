import 'dart:async';
import 'package:automobile_doctor/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splashScr.dart';

void main() async {
  //For Android
  /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); */

//For Web
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCx3kYaWH2ys1zmnPuMKpasViDYV7aa6Oo",
        projectId: "automobile-doctor-d35f1",
        messagingSenderId: "847427569641",
        appId: "1:847427569641:web:526dbda5b630e4f540ad78"),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoDoc',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashPage(), // SplashScr(),
      debugShowCheckedModeBanner: false,
    );
  }
}
