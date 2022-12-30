import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/NewRecords.dart';
import 'Display.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Display()));
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ))
          ],
          toolbarHeight: 60,
          title: Text(
            'Record',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Color.fromRGBO(0, 103, 254, 50),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}