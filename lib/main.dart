import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'Screens/AllRecords.dart';

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
        body: Splash(),
      ),
    );
  }
}

