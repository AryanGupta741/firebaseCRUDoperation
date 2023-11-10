import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/readdata.dart';
import 'package:firestorepracticle/update.dart';
import 'package:flutter/material.dart';

class formfield extends StatelessWidget {
  formfield({super.key});
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData()));
                CollectionReference ref =
                    FirebaseFirestore.instance.collection('users');
                ref.add({
                  'name' : nameController.text,
                });
              },
              child: const Text("ok"))
        ],
      ),
    );
  }
}
