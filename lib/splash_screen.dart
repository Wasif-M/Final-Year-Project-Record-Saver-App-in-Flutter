import 'package:flutter/material.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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