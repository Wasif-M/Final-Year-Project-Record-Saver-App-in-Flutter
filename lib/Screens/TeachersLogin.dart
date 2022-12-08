import "package:flutter/material.dart";
import 'HomeScreen.dart';
class teachersLogin extends StatefulWidget {
  const teachersLogin({Key? key}) : super(key: key);

  @override
  State<teachersLogin> createState() => _teachersLoginState();
}

class _teachersLoginState extends State<teachersLogin> {
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(

            height:
            size.height * .30, // height of container is total 45% of height
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                //color: Color.fromRGBO(51, 52, 78, 90),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/teacherslogin.PNG'),
                )),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      suffixIcon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Enter Student Email",),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      labelText: "Enter Password",
                      hintText: ".....",),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    },
                    child: Text("login", style: TextStyle(color: Colors.white,fontSize: 20)),
                    color: Color.fromRGBO(0, 103, 254, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

