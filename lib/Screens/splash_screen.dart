import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'user.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: EasySplashScreen(
        logo: Image(image: AssetImage('assets/ilustration.png')),
        logoWidth: 200,
        navigator: WhoAreYou(),
        durationInSeconds: 2,
        showLoader: false,
      ),
    );
  }
}
