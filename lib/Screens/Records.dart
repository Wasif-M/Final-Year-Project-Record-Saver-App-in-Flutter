import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

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
                  Navigator.pop(context);
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
        body: ViewRecords(),
      ),
    );
  }
}
class ViewRecords extends StatefulWidget {
  const ViewRecords({Key? key}) : super(key: key);

  @override
  State<ViewRecords> createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  late DatabaseReference dbR;
  TextEditingController _date = TextEditingController();
  TextEditingController projectName = TextEditingController();
  TextEditingController supervisorName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController batch = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /*void initState() {
    super.initState();
    dbR = FirebaseDatabase.instance.ref().child("NewRecords");
    showData();
  }
  void showData () async {
    DataSnapshot snapshot=await dbR.child(dbR.key.toString()).get();
    Map<dynamic,dynamic> NewRecords = snapshot.value as Map;
      projectName.text=NewRecords['Project Name'];
      supervisorName.text=NewRecords['Supervisor Name'];
      _date.text=NewRecords['Date'];
      description.text=NewRecords['Description'];
      batch.text=NewRecords['Batch'];

  }*/
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        child: Form(
          //key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: projectName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                      labelText: "Project Title"
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: supervisorName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                      labelText: "Supervisor Name"
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: batch,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                      labelText: "Batch No",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                    controller: _date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                      labelText: "Date"
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                      labelText: "Description"
                  ),

                  controller: description,

                ),
              ),
              SizedBox(height: 15),
              /*MaterialButton(
                onPressed: () {

                  Map<String, String> NewRecords = {
                    "Project Name": projectName.text,
                    "Supervisor Name": supervisorName.text,
                    "Description": description.text,
                    "Date": _date.text,
                    "Batch No": batch.text,
                  };
                  dbR.child(NewRecords.keys.toString()).update(NewRecords)
                      .then((value) => {
                    Navigator.pop(context)
                  });


                },
                child: const Text('Update Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),*/
            ],
          ),
        ),
      ),
    );

  }
}
