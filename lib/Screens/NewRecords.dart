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
          leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},),
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
        body: Form(),
      ),
    );
  }
}
class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController _date=TextEditingController();
  var projectName=TextEditingController();
  var supervisorName=TextEditingController();
  var description=TextEditingController();
  var batch=TextEditingController();
  late DatabaseReference dbR;
  @override
  void initState(){
    super.initState();
    dbR= FirebaseDatabase.instance.ref().child("NewRecords");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(child: Image(image: AssetImage("assets/fill.jpg"),),),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: projectName,
                maxLines: 5, minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  labelText: "Project Title",
                  hintText: "Enter Project Title",),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: supervisorName,
                maxLines: 5, minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  labelText: "Supervisor Name",
                  hintText: "Enter Supervisor Name",),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: batch,
                  maxLines: 5, minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  labelText: "Batch No",
                  hintText: "Enter Batch No",),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                    controller: _date,

                    decoration: InputDecoration(
                        labelText: "Select Year",
                        icon: Icon(Icons.calendar_today_rounded),
                        hintText: "Group",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onTap: () async {
                      DateTime? pickeddate= await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1966),
                        lastDate: DateTime(2024),
                      );
                      if(pickeddate != null){
                        setState(() {
                          _date.text= formatDate(pickeddate, [yyyy, '-', mm, '-', dd]);
                        });
                      }
                    }
                ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: description,
                cursorHeight: 20,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  labelText: "Description",
                  hintText: "Enter Project Description",),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                child: MaterialButton(
                  onPressed: (){
                    Map<String,String> NewRecords= {
                      "Project Name":projectName.text,
                      "Supervisor Name":supervisorName.text,
                      "Description":description.text,
                      "Date": _date.text,
                      "Batch No":batch.text,
                    };
                    dbR.push().set(NewRecords);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(12)),
                    child: Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
