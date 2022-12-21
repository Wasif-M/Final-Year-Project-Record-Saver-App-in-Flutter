import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/user.dart';
import 'NewRecords.dart';
import 'package:fyp_recordsaver/Screens/Display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:
                size.height * .48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white,
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/home.png'),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Display()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.verified_user_outlined,
                              size: 100,
                              color: Color.fromRGBO(0, 103, 254, 50),
                            ),
                            Text(
                              "All Records",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 103, 254, 50),
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewRecords()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_calendar_outlined,
                              size: 100,
                              color: Color.fromRGBO(0, 103, 254, 50),
                            ),
                            Text(
                              "New Record",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 103, 254, 50),
                                  fontSize: 20),
                            )
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 600),
            child: MaterialButton(
              onPressed: () {
                setState(() {

                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WhoAreYou()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
