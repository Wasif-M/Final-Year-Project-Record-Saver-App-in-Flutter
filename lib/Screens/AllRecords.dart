import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:fyp_recordsaver/Screens/Records.dart';
import 'HomeScreen.dart';
class AllRecords extends StatelessWidget {
  const AllRecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},),
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
        body: _listView(context),
      ),
    );
  }

  ListView _listView(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              "Project No $index",
              style: TextStyle(
                  color: Color.fromRGBO(0, 103, 254, 50), fontSize: 20),
            ),
            leading: Icon(
              Icons.verified_user_outlined,
              color: Color.fromRGBO(0, 103, 254, 50),
            ),
            trailing: IconButton(icon: Icon(Icons.forward_sharp),color: Color.fromRGBO(0, 103, 254, 50),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Records()));},)
          ),
        );
      },
    );
  }
}
