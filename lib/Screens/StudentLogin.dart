import 'package:flutter/material.dart';
import 'package:auth/auth.dart';
import 'package:fyp_recordsaver/Widgets/text_field.dart';
import 'StudentDisplay.dart';
import "package:fyp_recordsaver/Screens/database/user_authentication.dart";

class studentInformation extends StatefulWidget {
  @override
  State<studentInformation> createState() => _studentInformationState();
}

class _studentInformationState extends State<studentInformation> {
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    _auth
        .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then((value) => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const studentDisplay())),
            });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  height: size.height * .30,
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

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 270),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Center(
                        child: Container(
                          child: Text("Student Login",style: TextStyle(color: Color.fromRGBO(0, 103, 254, 50),fontSize: 25,fontWeight: FontWeight.w800),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: EmailTextField(
                        emailController: emailController,
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: PasswordTextField(
                          passwordController: passwordController,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        child: MaterialButton(
                          onPressed: () {
                            final isValidForm = formKey.currentState!.validate();
                            if (isValidForm) {
                              login();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
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
