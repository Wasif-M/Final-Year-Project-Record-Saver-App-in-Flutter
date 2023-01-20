import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_recordsaver/Screens/HomeScreen.dart';
import 'package:fyp_recordsaver/Screens/StudentDisplay.dart';

class ValidateEmailAndPassword {
  final String emailController;
  final String passwordController;
  final BuildContext context;
  bool? state;
  GlobalKey<FormState> key;
  ValidateEmailAndPassword(
      {required this.emailController,
        required this.passwordController,
        required this.context,
        required this.key,
        this.state});
  String errorMessage = '';

  userSignInAndSighnUp() async {
    if (key.currentState!.validate()) {
      try {
        if (state == true) {
          //validation of signing
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailController, password: passwordController)
              .then(
                (value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          );
          //validation of signup
        } else {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: emailController, password: passwordController)
              .then(
                (value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                      (Route<dynamic> route) => false);
            },
          );
        }
        errorMessage = '';
      } on FirebaseException catch (e) {
        errorMessage = e.code;
        //An error from the firbase will trigger the snack bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class StudentValidateEmailAndPassword {
  final String emailController;
  final String passwordController;
  final BuildContext context;
  bool? state;
  GlobalKey<FormState> key;
  StudentValidateEmailAndPassword(
      {required this.emailController,
        required this.passwordController,
        required this.context,
        required this.key,
        this.state});
  String errorMessage = '';

  studentLogin() async {
    if (key.currentState!.validate()) {
      try {
        if (state == true) {
          //validation of signing
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailController, password: passwordController)
              .then(
                (value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const studentDisplay(),
                ),
              );
            },
          );
          //validation of signup
        } else {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: emailController, password: passwordController)
              .then(
                (value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const studentDisplay(),
                  ),
                      (Route<dynamic> route) => false);
            },
          );
        }
        errorMessage = '';
      } on FirebaseException catch (e) {
        errorMessage = e.code;
        //An error from the firbase will trigger the snack bar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Email addrees is required';
  }

  return null;
}
//To checking the password field is empty or not
String? validatePassword(String? formpass) {
  if (formpass == null || formpass.isEmpty) {
    return 'Password is required';
  }
  return null;
}
