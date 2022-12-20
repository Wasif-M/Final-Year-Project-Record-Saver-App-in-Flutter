import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/AllRecords.dart';
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
            IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined)),
          ],
          leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Display()));},),
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
        //body: _listView(context),
      ),
    );
  }
}

