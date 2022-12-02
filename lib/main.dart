import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/HomeScreen.dart';
import "splash_screen.dart";
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: NewRecord(),
      ),
    );
  }
}
class NewRecord extends StatefulWidget {
  const NewRecord({Key? key}) : super(key: key);

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
