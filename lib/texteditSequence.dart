import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/readEditSequence.dart';
import 'package:firestorepracticle/readdata.dart';
import 'package:flutter/material.dart';

class ControllerPractice extends StatefulWidget {
  const ControllerPractice({super.key});

  @override
  State<ControllerPractice> createState() => _ControllerPracticeState();
}

class _ControllerPracticeState extends State<ControllerPractice> {
  final TextEditingController nameController = TextEditingController();
  String? firstName;
  void addToFirebase(firstName) {
    FirebaseFirestore.instance.collection('users').add({
      'name': nameController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadEdit()));
                    setState(() {
                      firstName = nameController.text;
                      addToFirebase(firstName);
                    });
                  },
                  child: const Text('ok')),
              SizedBox(
                height: 10,
              ),
              Text('$firstName'),
            ],
          ),
        ),
      ),
    );
  }
}
