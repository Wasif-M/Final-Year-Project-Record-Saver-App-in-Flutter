import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user.dart';
import 'Records.dart';

class studentDisplay extends StatefulWidget {
  const studentDisplay({Key? key}) : super(key: key);

  @override
  State<studentDisplay> createState() => _studentDisplayState();
}

class _studentDisplayState extends State<studentDisplay> {
  final dbR = FirebaseDatabase.instance.ref("NewRecords");
  final searchFilter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
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
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert_rounded),
                      //color: Color.fromRGBO(0, 103, 254, 50),
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 1,child: ListTile(
                          leading: Icon(Icons.remove_red_eye_sharp),
                          title: Text("View"),
                          onTap: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => Records()));
                          },
                        )),

                      ],
                    ),
                    title: Text(
                      snapshot.child("Project Name").value.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),
                    ),
                    subtitle: Text(snapshot.child("Date").value.toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(0, 103, 254, 50),
                            fontSize: 10)),
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
                          leading: Icon(Icons.remove_red_eye_rounded),
                          title: Text("View"),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => Records()));
                          },
                        )),
                      ],
                    ),
                    title: Text(
                      snapshot.child("Project Name").value.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),
                    ),
                    subtitle: Text(snapshot.child("Date").value.toString(),
                        style: TextStyle(
                            color: Color.fromRGBO(0, 103, 254, 50),
                            fontSize: 10)),
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
}
