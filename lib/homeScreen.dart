import 'package:automobile_doctor/addVehicles.dart';
import 'package:automobile_doctor/landingScreen.dart';
import 'package:automobile_doctor/servicePackages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import "package:firebase_core/firebase_core.dart";

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

  String automobileMake = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.logout),
                color: Colors.white,
                onPressed: () {
                  signOut();
                }),
          ],
          title: Card(
              child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                automobileMake = val;
              });
            },
          )),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (automobileMake != "")
              ? FirebaseFirestore.instance
                  .collection('automobile_doctors')
                  .where("expertiseLowerCase",
                      isEqualTo: automobileMake.toLowerCase())
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection('automobile_doctors')
                  .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return Card(
                    child: ListTile(
                      title:
                          Text(doc['name'].toString() + ' - ' + doc['contact']),
                      subtitle: Text(doc['expertise'].toString() +
                          ' ' +
                          doc['address'].toString()),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/autodoc.png"),
                      fit: BoxFit.cover,
                    )),
                child: Text(' '),
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewServicePackages()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

//child: MapSample(),
