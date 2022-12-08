import "package:flutter/material.dart";
import 'package:fyp_recordsaver/Screens/AllRecords.dart';
import 'HomeScreen.dart';
class teachersLogin extends StatefulWidget {
  const teachersLogin({Key? key}) : super(key: key);

  @override
  State<teachersLogin> createState() => _teachersLoginState();
}

class _teachersLoginState extends State<teachersLogin> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(

            height:
            size.height * .40, // height of container is total 45% of height
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
            padding: const EdgeInsets.only(top: 350),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      suffixIcon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Enter Student Email",),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      labelText: "Enter Password",
                      hintText: "Password",),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllRecords()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(12)),
                        child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Container(
                      child: Text("Supervisor Login",style: TextStyle(color: Color.fromRGBO(57, 43, 116, 50),fontSize: 35,fontWeight: FontWeight.w800),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

