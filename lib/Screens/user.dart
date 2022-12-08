import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/AllRecords.dart';
import 'package:fyp_recordsaver/Screens/HomeScreen.dart';
import 'package:fyp_recordsaver/Screens/StudentLogin.dart';
import 'package:fyp_recordsaver/Screens/TeachersLogin.dart';

class IdentifyWho extends StatelessWidget {
  const IdentifyWho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WhoAreYou(),
    );
  }
}

class WhoAreYou extends StatefulWidget {
  const WhoAreYou({Key? key}) : super(key: key);

  @override
  State<WhoAreYou> createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:
            size.height * .40, // height of container is total 45% of height
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white,
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/Who.png'),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 360),
              child: GridView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: 20,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> teachersLogin()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/teacherilustration.png")),
                            Text("Supervisor",style: TextStyle(color: Color.fromRGBO(0, 103, 254, 50),fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> studentInformation()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/Student.jpg")),
                            Text("Student",style: TextStyle(color: Color.fromRGBO(0, 103, 254, 50),fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 100.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
