import 'dart:async';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_recordsaver/Bar.dart';
import 'package:fyp_recordsaver/Screens/Update.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
    });
  }
  final dbR = FirebaseDatabase.instance.ref("NewRecords");
  final searchFilter = TextEditingController();
  final update = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              itemBuilder: (context, snapshot, animation, int index) {
                Map  NewRecords=snapshot.value as Map;
                NewRecords['key']=snapshot.key;
                final title = snapshot.child("Project Name").value.toString();
                if (searchFilter.text.isEmpty) {
                  return ListTile(
                    leading: Icon(
                      Icons.verified_user_outlined,
                      color: Color.fromRGBO(0, 103, 254, 50),
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert_rounded),
                      //color: Color.fromRGBO(0, 103, 254, 50),
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 1,child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("Delete"),
                          onTap: (){
                            var key=snapshot.key;
                            print("Delete Id" +key.toString());
                            _delete(key);
                          },
                        )),
                        PopupMenuItem(value: 1,child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Edit"),
                          onTap: (){
                            setState(() {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => Update(recordsKey: NewRecords['key'],)),
                                      (route) => false);
                            });

                          },
                        )),

                      ],
                    ),
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
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert_rounded),
                      //color: Color.fromRGBO(0, 103, 254, 50),
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 1,child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text("Delete"),
                          onTap: (){
                            var key=snapshot.key;
                            print("Delete Id" +key.toString());
                            _delete(key);
                          },
                        )),
                        PopupMenuItem(value: 1,child: ListTile(
                          leading: Icon(Icons.edit),
                          title: Text("Edit"),
                          onTap: (){
                            setState(() {
                              Navigator.push(context,MaterialPageRoute(builder: (_)=>Update(recordsKey: NewRecords['key'],)));
                            });
                            //getData(key);
                          },
                        )),
                      ],
                    ),
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
                } else
                  return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _delete(var key )async {
    await dbR.child(key).remove();
  }
}
