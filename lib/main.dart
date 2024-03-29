import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/splash_screen.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_core_web/firebase_core_web.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

