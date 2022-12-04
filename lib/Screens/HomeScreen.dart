import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/AllRecords.dart';
import 'NewRecords.dart';
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
            size.height * .45, // height of container is total 45% of height
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Color.fromRGBO(51, 52, 78, 90),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/home.png'),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: GridView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllRecords()));
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
                            Text("All Records",style: TextStyle(color: Color.fromRGBO(0, 103, 254, 50),fontSize: 20),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewRecords()));
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
                            Text("New Record",style: TextStyle(color: Color.fromRGBO(0, 103, 254, 50),fontSize: 20),)
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

