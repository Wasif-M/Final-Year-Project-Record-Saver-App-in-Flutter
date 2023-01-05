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
  bool _loading =false;
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => studentDisplay())),
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 270),
                child: Column(
                  children: [
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
                          hintText: "Enter Student Email",
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
                            setState(() {
                              _loading=true;
                            });
                            Future.delayed(Duration(seconds: 15));
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
                            child: _loading ? CircularProgressIndicator(color: Colors.white,):Text(
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
                    Container(
                      child: Text(
                        "Student Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(100, 165, 255, 50),
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
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
