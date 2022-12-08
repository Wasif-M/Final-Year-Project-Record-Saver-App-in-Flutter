import 'package:flutter/material.dart';


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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(child: Container(width: double.infinity,height: 350,child: Image(image: AssetImage('assets/who.jpg'),),)),
            SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text("Identify Your Domain",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromRGBO(0, 103, 254, 20)),textAlign: TextAlign.left,),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}