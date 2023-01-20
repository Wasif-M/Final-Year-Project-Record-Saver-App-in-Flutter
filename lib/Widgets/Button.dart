import "package:fyp_recordsaver/Screens/database/user_authentication.dart";
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool? state;
  final GlobalKey<FormState> key1;
  final String text;
  const Button({
    required this.emailController,
    required this.key1,
    Key? key,
    required this.passwordController,
    required this.text,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      //decoration: BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
        onPressed: () {
          final validation = ValidateEmailAndPassword(
            context: context,
            key: key1,
            emailController: emailController.text.trim(),
            passwordController: passwordController.text.trim(),
            state: state,
          );
          validation.userSignInAndSighnUp();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool? state;
  final GlobalKey<FormState> key1;
  final String text;
  const CustomButton({
    required this.emailController,
    required this.key1,
    Key? key,
    required this.passwordController,
    required this.text,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      //decoration: BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
        onPressed: () {
          final validation = StudentValidateEmailAndPassword(
            context: context,
            key: key1,
            emailController: emailController.text.trim(),
            passwordController: passwordController.text.trim(),
            state: state,
          );
          validation.studentLogin();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        ),
      ),
    );
  }
}
