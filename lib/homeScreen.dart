import 'package:automobile_doctor/addVehicles.dart';
import 'package:automobile_doctor/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? loggedinUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  signOut();
                  //Implement logout functionality
                }),
          ],
          title: Text('Home Page'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Container(
              child: TextButton(
            child: const Text(
              "Help",
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () async {
              //
            },
          )) /* Text(
          "Welcome " + _auth.currentUser.email,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ) */
          ,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Add Vehicles'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddVehicles()),
                  );
                },
              ),
              ListTile(
                title: const Text('Service Packages'),
                onTap: () {
                  /*  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CreatePatientRegistrations()),
                  ); */
                },
              ),
            ],
          ),
        ));
  }
}

//child: MapSample(),
