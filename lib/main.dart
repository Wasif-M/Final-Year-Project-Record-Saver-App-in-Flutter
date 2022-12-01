import 'package:flutter/material.dart';
import "splash_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomeScreen(),
      ),
    );
  }
}

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
                  image: AssetImage('assets/home.PNG'),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: GridView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Stack(
                      children: [
                        Ink.image(image: AssetImage('assets/verify.png'))
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
