import "package:flutter/material.dart";
import 'HomeScreen.dart';
import 'package:auth/auth.dart';
class teachersLogin extends StatefulWidget {
  const teachersLogin({Key? key}) : super(key: key);

  @override
  State<teachersLogin> createState() => _teachersLoginState();
}

class _teachersLoginState extends State<teachersLogin> {
  bool loading=false;
  final _auth = FirebaseAuth.instance;
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
  final formKey= GlobalKey<FormState>();

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void login(){
    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(),).then((value){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }


  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
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

              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        validator: (emailController){
                          if (emailController!.isNotEmpty) {
                            if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController)) {
                              return null;
                            }
                          } else {
                            return 'Email is required';
                          }
                          return 'Invalid email';
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          suffixIcon: Icon(Icons.email),
                          labelText: "Email",
                          hintText: "Enter Student Email",),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        validator: (passwordController){
                          if (passwordController!.isNotEmpty) {
                            if (passwordController.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          } else {
                            return 'Password is required';
                          }
                        },
                        controller: passwordController,
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
                            final isValidForm= formKey.currentState!.validate();
                            if(isValidForm){
                            login();}
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
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Center(
                        child: Container(
                          child: Text("Supervisor Login",style: TextStyle(color: Color.fromRGBO(57, 43, 116, 50),fontSize: 25,fontWeight: FontWeight.w800),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

