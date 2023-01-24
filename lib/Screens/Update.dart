import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/HomeScreen.dart';

class Update extends StatefulWidget {
  late String recordsKey;

 Update({required this.recordsKey});

  @override

  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController _date = TextEditingController();
  TextEditingController projectName = TextEditingController();
  TextEditingController supervisorName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController batch = TextEditingController();
  late DatabaseReference dbR;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading =false;
  @override
  void initState() {
    super.initState();
    dbR = FirebaseDatabase.instance.ref().child("NewRecords");
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SizedBox(height: 10),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: projectName,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Project Title",
                      hintText: "Enter Project Title",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: supervisorName,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Supervisor Name",
                      hintText: "Enter Supervisor Name",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: batch,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.numbers_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Batch No",
                      hintText: "Enter Batch No",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                      controller: _date,
                      decoration: InputDecoration(
                          labelText: "Select Year",
                          icon: Icon(Icons.calendar_today_rounded),
                          hintText: "Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1966),
                          lastDate: DateTime(2028),
                        );
                        if (pickeddate != null) {
                          setState(() {
                            _date.text =
                                formatDate(pickeddate, [yyyy, '-', mm, '-', dd]);
                          });
                        }
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: description,
                    cursorHeight: 20,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      icon: Icon(Icons.description_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Description",
                      hintText: "Enter Project Description",
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    child: MaterialButton(
                      onPressed: () {
                        Map<String, String> NewRecords = {
                          "Project Name": projectName.text,
                          "Supervisor Name": supervisorName.text,
                          "Description": description.text,
                          "Date": _date.text,
                          "Batch No": batch.text,
                        };
                        dbR.child(widget.recordsKey).update(NewRecords).then((value) => {Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()))});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void getData() async{
    DataSnapshot snapshot=await dbR.child(widget.recordsKey).get();
    Map NewRecords=snapshot.value as Map;
    projectName.text=NewRecords["Project Name"];
    supervisorName.text=NewRecords["Supervisor Name"];
    _date.text=NewRecords["Date"];
    batch.text=NewRecords['Batch No'];
    description.text=NewRecords['Description'];
  }
}

