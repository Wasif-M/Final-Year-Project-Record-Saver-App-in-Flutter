import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'HomeScreen.dart';
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
  var departName=TextEditingController();
  var groupName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: projectName,
              decoration: InputDecoration(
                  labelText: "Project Name",
                  hintText: "Enter Project Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: supervisorName,
              decoration: InputDecoration(
                  labelText: "Supervisor Name",
                  hintText: "Enter Supervisor Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: departName,
              decoration: InputDecoration(
                  labelText: "Department Name",
                  hintText: "Enter Department Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller:groupName,
              decoration: InputDecoration(
                  labelText: "Group Name",
                  hintText: "Enter Group Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
                controller: _date,

                decoration: InputDecoration(
                    labelText: "Select Year",
                    icon: Icon(Icons.calendar_today_rounded),
                    hintText: "Group",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
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

          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              child: Text("Save", style: TextStyle(color: Colors.white)),
              color: Color.fromRGBO(0, 103, 254, 50),
            ),
          )
        ],
      ),
    );
  }
}
