import "package:flutter/material.dart";
import 'package:fyp_recordsaver/Widgets/Button.dart';
import 'package:fyp_recordsaver/Widgets/text_field.dart';
class teachersLogin extends StatefulWidget {
  const teachersLogin({Key? key}) : super(key: key);

  @override
  State<teachersLogin> createState() => _teachersLoginState();
}

class _teachersLoginState extends State<teachersLogin> {
  bool loading=false;
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
  final formKey= GlobalKey<FormState>();

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
                size.height * .40,
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Center(
                        child: Container(
                          child: Text("Supervisor Login",style: TextStyle(color: Color.fromRGBO(57, 43, 116, 50),fontSize: 25,fontWeight: FontWeight.w800),),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: EmailTextField(
                        emailController: emailController,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:  PasswordTextField(
                      passwordController: passwordController,
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:  Button(
                        emailController: emailController,
                        key1: formKey,
                        passwordController: passwordController,
                        text: 'Login',
                        state: true,
                      ),
                    ),
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

