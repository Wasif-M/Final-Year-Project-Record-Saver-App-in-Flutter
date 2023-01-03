import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'HomeScreen.dart';

import 'package:firebase_database/firebase_database.dart';

class NewRecords extends StatelessWidget {
  const NewRecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          toolbarHeight: 60,
          title: Text(
            'New Records',
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
        body: DataFilling(),
      ),
    );
  }
}

class DataFilling extends StatefulWidget {
  const DataFilling({Key? key}) : super(key: key);

  @override
  State<DataFilling> createState() => _DataFillingState();
}

class _DataFillingState extends State<DataFilling> {
  TextEditingController _date = TextEditingController();
  var projectName = TextEditingController();
  var supervisorName = TextEditingController();
  var description = TextEditingController();
  var batch = TextEditingController();
  late DatabaseReference dbR;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    dbR = FirebaseDatabase.instance.ref().child("NewRecords");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SizedBox(height: 10),
              Container(
                child: Image(
                  image: AssetImage("assets/fill.jpg"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  validator: (projectName) {
                    if (projectName!.isNotEmpty) {
                      if (RegExp(r"^[a-zA-Z ]+$").hasMatch(projectName)) {
                        return null;
                      }
                      return 'Invalid ProjectName';
                    } else {
                      return 'ProjectName required';
                    }
                  },
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
                  validator: (supervisorName) {
                    if (supervisorName!.isNotEmpty) {
                      if (RegExp(r"^[a-zA-Z ]+$").hasMatch(supervisorName)) {
                        return null;
                      }
                      return 'Invalid SupervisorName';
                    } else {
                      return 'SupervisorName required';
                    }
                  },
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
                  validator: (batch) {
                    if (batch!.isNotEmpty) {
                      if (RegExp(r"^[0-9]+$").hasMatch(batch)) {
                        return null;
                      }
                      return 'Invalid BatchNo';
                    } else {
                      return 'BatchNo is required';
                    }
                  },
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
                    validator: (_date) {
                      if (_date!.isNotEmpty) {
                        if (RegExp(r"^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$").hasMatch(_date)) {
                          return null;
                        }
                        return 'Invalid Date';
                      } else {
                        return 'Date is required';
                      }
                    },
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
                  validator: (description) {
                    if (description!.isNotEmpty) {
                      if (RegExp(r"^[a-zA-Z]*$").hasMatch(description)) {
                        return null;
                      }
                      return 'Invalid Description';
                    } else {
                      return 'Description is required';
                    }
                  },

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
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        Map<String, String> NewRecords = {
                          "Project Name": projectName.text,
                          "Supervisor Name": supervisorName.text,
                          "Description": description.text,
                          "Date": _date.text,
                          "Batch No": batch.text,
                        };
                        dbR.push().set(NewRecords);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomeScreen()), (route) => false);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Save',
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
    );
  }
}
