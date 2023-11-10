import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/readdata.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  Future<void> updateData() async{
    try{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference ref = firestore.collection('users');
      DocumentReference docRef = ref.doc('8o2VaTCWKpS0BvPyAcWU');
      Map<String, dynamic> updatedData = {
        'name': 'Dream'
      };
     await docRef.update(updatedData);

    print('Data updated successfully.');
  } catch (e) {
    print('Error updating data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(''),
        ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReadData()));
          updateData();}, child: Text('edit'))
      ]),
    );
  }
}
