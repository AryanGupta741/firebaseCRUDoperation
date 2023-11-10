import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homeScreen extends StatelessWidget {


  Future<void> addDataToFirestore(String name, String surname) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('users').add({
        'name': name,
        'surname': surname,
      });
      debugPrint('data add successfully ');
    } catch (e) {
      debugPrint('error: : $e');
    }
  }

  // const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 100,
        height: 100,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: FloatingActionButton(
          onPressed: () {
            addDataToFirestore('Ansh', 'Gupta');
          },
          child: Icon(Icons.add,
          color: Colors.red,
          ),
        ),
      ),
    );
  }
}
