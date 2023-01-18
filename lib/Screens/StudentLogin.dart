import 'package:flutter/material.dart';
import 'package:auth/auth.dart';
import 'StudentDisplay.dart';

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
                      child: TextFormField(
                        validator: (emailController) {
                          if (emailController!.isNotEmpty) {
                            if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController)) {
                              return null;
                            }
                          } else {
                            return 'Email is required';
                          }
                          return 'Invalid email';
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          suffixIcon: Icon(Icons.email),
                          labelText: "Email",
                          hintText: "gmail@.com",
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          validator: (passwordController) {
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(onTap: (){
                              setState(() {
                                _isHidden=! _isHidden;
                              });
                            },
                              child: Icon(_isHidden ? Icons.visibility :Icons.visibility_off),),
                            labelText: "Enter Password",
                            hintText: "Password",
                          ),
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
