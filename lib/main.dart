import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splashScr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SplashScr(),
      debugShowCheckedModeBanner: false,
    );
  }
}
