// ignore: depend_on_referenced_packages
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
          title: const Text('Automobiles'),
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: AddVehiclesFormComponent()));
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
  final _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  int _selectedGender = 0;
  String _selectedGenderString = '';
  String _password = '';
  bool _termsChecked = true;

  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList = [];
    genderList.add(const DropdownMenuItem(
      child: Text('Male'),
      value: 0,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('Female'),
      value: 1,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('Others'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
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
      decoration:
          const InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
      validator: (value) {
        if (value != null) {
          return 'Please enter a name';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _name = value.toString();
        });
      },
    ));

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null) {
          return 'Enter age';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          _age = int.parse(value.toString());
        });
      },
    ));

    formWidget.add(DropdownButton(
      hint: const Text('Select Gender'),
      items: genderList,
      value: _selectedGender,
      onChanged: (value) {
        setState(() {
          _selectedGender = int.parse(value.toString());
        });
      },
      isExpanded: true,
    ));

    formWidget.add(Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
      ],
    ));

    void onPressedSubmit() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState?.save();

        print("Name " + _name);
        print("Email " + _email);
        print("Age " + _age.toString());
        switch (_selectedGender) {
          case 0:
            _selectedGenderString = "Male";
            break;
          case 1:
            _selectedGenderString = "Female";
            break;
          case 3:
            _selectedGenderString = "Others";
            break;
        }
        print("Marital Status " + _maritalStatus);
        print("Password " + _password);
        print("Termschecked " + _termsChecked.toString());

        FirebaseFirestore.instance.collection('driver_automobiles').add({
          "appointment": "Emma",
          "age": _age,
          "dept": "Opthalmology",
          "email": _email,
          "gender": _selectedGenderString,
          "name": _name,
          "maritalStatus": _maritalStatus
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Form Submitted')));
      }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Submit'), onPressed: onPressedSubmit));

    return formWidget;
  }
}
