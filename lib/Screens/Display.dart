import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user.dart';
import 'HomeScreen.dart';
import 'Records.dart';
class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final dbR = FirebaseDatabase.instance.ref("NewRecords");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WhoAreYou()));
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        toolbarHeight: 60,
        title: Text(
          'All Records',
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
      body: Column(
        children: [
          SafeArea(
              child: Card(
                child: FirebaseAnimatedList(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  query: dbR,
                  itemBuilder: (context, snapshot,
                      animation, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.verified_user_outlined,
                        color: Color.fromRGBO(0, 103, 254, 50),
                      ),
                        trailing: IconButton(icon: Icon(Icons.forward_sharp),color: Color.fromRGBO(0, 103, 254, 50),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Records()));},),
                      title:
                          Text(snapshot.child("Project Name").value.toString(),style: TextStyle(
                              color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),),
                    );
                  },
                ),
              ),

          ),
        ],
      ),
    );
  }
}
