import 'package:flutter/material.dart';
import 'package:auth/auth.dart';
import 'Display.dart';



class studentInformation extends StatefulWidget {
  const studentInformation({Key? key}) : super(key: key);

  @override
  State<studentInformation> createState() => _studentInformationState();
}

class _studentInformationState extends State<studentInformation> {
  final _auth = FirebaseAuth.instance;
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
  bool _isHidden = true;
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void login()
  {
    _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(),).then((value) => {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => Display())),
    });
  }
  /*void login(){
    _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(),).then((value){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AllRecords()));
    }).onError((error, stackTrace) => {
      Utils().toastMessage(error.toString())
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(

            height:
            size.height * .30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                //color: Color.fromRGBO(51, 52, 78, 90),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/login.jpg'),
                )),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 270),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      suffixIcon: Icon(Icons.email),

                        labelText: "Email",
                        hintText: "Enter Student Email",),
                  ),
                ),
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          labelText: "Enter Password",
                          hintText: "Password",),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    child: MaterialButton(
                      onPressed: (){
                          login();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(12)),
                        child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                      ),
                    ),
                  ),
                ),
                Container(
                          child: Text("Student Login",textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(100, 165, 255, 50),fontSize: 25,fontWeight: FontWeight.w800,),),
                        ),

              ],
            ),
          ),
        ],
      ),
    );
  }

}




