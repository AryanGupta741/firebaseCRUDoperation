import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/updateEditScreen.dart';
import 'package:flutter/material.dart';

class ReadEdit extends StatefulWidget {
  const ReadEdit({super.key});

  @override
  State<ReadEdit> createState() => _ReadEditState();
}

class _ReadEditState extends State<ReadEdit> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String data = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('user').doc('8o2VaTCWKpS0BvPyAcWU').get();
      if (snapshot.exists) {
        setState(() {
          Map<String, dynamic> documentData =
              snapshot.data() as Map<String, dynamic>;
          data = documentData['name'];
        });
      } else {
        setState(() {
          data = 'data not found';
        });
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(data),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateEdit()));
            });
          }, child: Text('update'))
        ],
      ),
    );
  }
}
