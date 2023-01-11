import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/NewRecords.dart';
import 'package:firebase_database/firebase_database.dart';
class Useful extends StatefulWidget {
  const Useful({Key? key}) : super(key: key);

  @override
  State<Useful> createState() => _UsefulState();
}

class _UsefulState extends State<Useful> {
  late DatabaseReference dbR;
  void initState() {
    super.initState();
    dbR = FirebaseDatabase.instance.ref().child("NewRecords");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: FirebaseAnimatedList(
        query: dbR,
        itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

          Map NewRecords = snapshot.value as Map;
          NewRecords['key'] = snapshot.key;

          return NewRecords['key'];

        },
      ),
    );
  }
}

