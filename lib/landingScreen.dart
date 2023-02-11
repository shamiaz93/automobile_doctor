import 'package:automobile_doctor/signupForm.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/carDet3.jpg'),
            Image.asset('assets/images/carDet2.jpg'),
            /*Image.asset('assets/images/carDet1.jpg'), */
          ],
        ),
      ),
    );
  }
}
