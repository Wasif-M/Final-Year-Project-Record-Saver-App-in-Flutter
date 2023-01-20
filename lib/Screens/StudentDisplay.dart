import 'dart:async';
import 'package:auth/auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_recordsaver/Bar.dart';
import 'package:fyp_recordsaver/Screens/user.dart';


class studentDisplay extends StatefulWidget {
  const studentDisplay({Key? key}) : super(key: key);

  @override

  State<studentDisplay> createState() => _studentDisplayState();
}

class _studentDisplayState extends State<studentDisplay> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
    });
  }
  final dbR = FirebaseDatabase.instance.ref("NewRecords");
  final searchFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                signOutUser(context);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: searchFilter,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),

            FirebaseAnimatedList(
              defaultChild: const ProgressBar(),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              query: dbR,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child("Project Name").value.toString();
                if (searchFilter.text.isEmpty) {
                  return ListTile(
                    leading: Icon(
                      Icons.verified_user_outlined,
                      color: Color.fromRGBO(0, 103, 254, 50),
                    ),
                    trailing: Icon(Icons.save_alt,color: Color.fromRGBO(0, 103, 254, 50),),
                    title: Text(
                      snapshot.child("Project Name").value.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),
                    ),
                    subtitle:Column(
                      children: [
                        Text("Supervisor: "+snapshot.child("Supervisor Name").value.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 16)),
                        Text("Bacth No:" +snapshot.child("Batch No").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 15)),
                        Text("Description: "+snapshot.child("Description").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 13)),
                        Text("Year: "+snapshot.child("Date").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 10)),

                      ],
                    )

                  );
                } else if (title
                    .toString()
                    .contains(searchFilter.text.toString())) {
                  return ListTile(
                      leading: Icon(
                        Icons.verified_user_outlined,
                        color: Color.fromRGBO(0, 103, 254, 50),
                      ),
                      trailing: Icon(Icons.save_alt,color: Color.fromRGBO(0, 103, 254, 50),),
                    title: Text(
                      snapshot.child("Project Name").value.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),
                    ),
                    subtitle: Column(
                      children: [
                        Text("Supervisor: "+snapshot.child("Supervisor Name").value.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 16)),
                        Text("Bacth No: "+snapshot.child("Batch No").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 15)),
                        Text("Description: "+snapshot.child("Discription").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 13)),
                        Text("Year: "+snapshot.child("Date").value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 103, 254, 50),
                                fontSize: 10)),

                      ],
                    )
                  );
                } else
                  return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
  signOutUser(BuildContext ctx) {
    FirebaseAuth.instance.signOut().then(
          (value) => Navigator.of(ctx).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WhoAreYou()),
              (Route<dynamic> route) => false),
    );
  }
}
