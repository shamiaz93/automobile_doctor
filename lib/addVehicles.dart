// ignore: depend_on_referenced_packages
import 'package:automobile_doctor/customButton.dart';
import 'package:automobile_doctor/customTextField.dart';
import 'package:automobile_doctor/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class AddVehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Automobiles'),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 350, child: AddVehiclesFormComponent()),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('driver_automobiles')
                    .where("user_email",
                        isEqualTo: loggedinUser!.email.toString())
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
                            title: Text(doc['vehicleMake'].toString() +
                                ' ' +
                                doc['vehicleModel']),
                            subtitle: Text(
                                doc['vehicleAge'].toString() + ' Years old'),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              )),
            ],
          ),
        ));
  }
}

class AddVehiclesFormComponent extends StatefulWidget {
  @override
  _AddVehiclesState createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehiclesFormComponent> {
  final modelController = TextEditingController();
  final makeController = TextEditingController();
  final vehicleAgeController = TextEditingController();
  final _user = loggedinUser!.email.toString();

  void addVehiclesDet() {
    print("user_email " + _user);
    print("modelController " + modelController.text.toString());
    print("makeController " + makeController.text.toString());
    print("vehicleAgeController " + vehicleAgeController.text.toString());

    FirebaseFirestore.instance.collection('driver_automobiles').add({
      "user_email": _user,
      "vehicleAge": vehicleAgeController.text.toString(),
      "vehicleMake": makeController.text.toString(),
      "vehicleModel": modelController.text.toString()
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Vehicle data added')));
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        shrinkWrap: true,
        reverse: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    height: 345,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("#ffffff"), //Colors.red[50],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyTextField(
                                  controller: makeController,
                                  hintText: "Vehicke Make",
                                  obscureText: false,
                                  prefixIcon: const Icon(Icons.car_repair),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyTextField(
                                  controller: modelController,
                                  hintText: "Vehicle Model",
                                  obscureText: false,
                                  prefixIcon: const Icon(Icons.car_repair),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                MyTextField(
                                  controller: vehicleAgeController,
                                  hintText: "Vehicle Age",
                                  obscureText: false,
                                  prefixIcon: const Icon(Icons.car_repair),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyButton(
                                  onPressed: addVehiclesDet,
                                  buttonText: 'Submit',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
