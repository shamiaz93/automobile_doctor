import 'package:automobile_doctor/signupForm.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';

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
              Icons.login,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationScreen()));
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
            /* const Padding(
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
            ), */
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ),
    );
  }
}
