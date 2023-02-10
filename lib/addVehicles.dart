// ignore: depend_on_referenced_packages
import 'package:automobile_doctor/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddVehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Automobiles'),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Expanded(child: AddVehiclesFormComponent()),
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
  AddVehicleFormState createState() {
    return AddVehicleFormState();
  }
}

class AddVehicleFormState extends State<AddVehiclesFormComponent> {
  final _formKey = GlobalKey<FormState>();

  String _model = '';
  String _make = '';
  int _vehicleAge = -1;
  String _user = loggedinUser!.email.toString();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          hintText: 'Make', labelText: 'Enter Vehicle Make'),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Vehicle Make';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _make = value.toString();
        });
      },
    ));

    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          hintText: 'Model', labelText: 'Enter Vehicle Model'),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Vehicle model';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _model = value.toString();
        });
      },
    ));

    formWidget.add(TextFormField(
      decoration: const InputDecoration(
          hintText: 'Vehicle Age', labelText: 'Enter Vehicle Age'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Vehicle age';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _vehicleAge = int.parse(value.toString());
        });
      },
    ));

    void onPressedSubmit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();

        FirebaseFirestore.instance.collection('driver_automobiles').add({
          "user_email": _user,
          "vehicleAge": _vehicleAge,
          "vehicleMake": _make,
          "vehicleModel": _model
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Vehicle data added')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Submit'), onPressed: onPressedSubmit));

    return formWidget;
  }
}
