import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextStore extends StatefulWidget {
  const TextStore({super.key});
  @override
  State<TextStore> createState() => _TextStoreState();
}

class _TextStoreState extends State<TextStore> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  String? firstname;
  String? surname;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? textNote;

  Future<void> _addToFirestore(firstname, surname) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firstname = nameController.text;
    surname = surnameController.text;
    try {
      await firestore.collection('information').add({
        'Firstname': firstname,
        'Surname': surname,
      });
      debugPrint("successfully");
      nameController.clear();
      surnameController.clear();

      //   if (firstname.isEmpty && surname.isEmpty) {
      //   FirebaseFirestore.instance.collection('personalinformation').add({
      //     'Firstname': firstname,
      //     'Surname': surname,
      //   });
      //   nameController.clear();
      //   surnameController.clear();
      // }
    } catch (e) {
      debugPrint("error error error error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  textNote = value;
                },
                controller: nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: surnameController,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({
                      'textNote' : textNote,
                    }).then((value) => print('user added'));
                    // setState(() {
                    //   String firstname = nameController.text;
                    //   String surname = surnameController.text;
                    //   _addToFirestore(firstname, surname);
                    // });
                  },
                  child: const Text("save data")),
              // Text('$firstname'),
              // Text('$surname'),
            ],
          ),
        ),
      ),
    );
  }
}
