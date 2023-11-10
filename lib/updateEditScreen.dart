import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/readEditSequence.dart';
import 'package:firestorepracticle/update.dart';
import 'package:flutter/material.dart';

class UpdateEdit extends StatefulWidget {
  const UpdateEdit({super.key});

  @override
  State<UpdateEdit> createState() => _UpdateEditState();
}

class _UpdateEditState extends State<UpdateEdit> {
  final TextEditingController updateController = TextEditingController();
  String? updatedata;
  Future<void> updatetext(updateData) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      CollectionReference ref = fireStore.collection('users');
      DocumentReference docRef = ref.doc('8o2VaTCWKpS0BvPyAcWU');
      Map<String, dynamic> updatedtext = {
        'name': updatedata,
      };
      await docRef.update(updatedtext);
      debugPrint('Data update successfully');
    } catch (e) {
      debugPrint('error error error error error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: updateController,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  updatedata = updateController.text;
                  updatetext(updatedata);
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadEdit()));
              },
              child: Text('update'))
        ],
      ),
    );
  }
}
