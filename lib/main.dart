import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
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

class SplashScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: LandingScreen(),
      title: const Text(
        'Automobile Doctor',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/autodoc.png'),
      loadingText: const Text("...."),
      photoSize: 100.0,
      loaderColor: Colors.grey,
    );
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Automobile Doctor"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            Card(
              child: Image.asset("assets/images/img1.jpg"),
              elevation: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Card(
              child: Image.asset("assets/images/img2.jpg"),
              elevation: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Card(
              child: Image.asset("assets/images/img3.jpg"),
              elevation: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Navigate to a new screen on Button click'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LandingScreen()));
            },
            child: const Text('Gradient')),
      ),
    );
  }
}
