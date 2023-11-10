import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestorepracticle/update.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String data = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(); //Fetch data when the widget is initialized
  }

  Future<void> fetchData() async {
    // Replace 'your_collection' with the name of your Firestore collection
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc('8o2VaTCWKpS0BvPyAcWU').get();
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
      setState(() {});
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Text(data),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UpdateData()));
                  });
                },
                child: Text('update'))
          ],
        ),
      ),
    );
  }
}
