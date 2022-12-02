import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image(
          image: AssetImage("assets/ilustration.png"),
        ),
      ),
    );
  }
}