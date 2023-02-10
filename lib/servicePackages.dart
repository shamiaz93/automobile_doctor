import 'package:automobile_doctor/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';

class ViewServicePackages extends StatelessWidget {
  const ViewServicePackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Packages"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('service_packages')
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
                    title: Text(doc['name'].toString()),
                    subtitle: Text(doc['price'].toString()),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
