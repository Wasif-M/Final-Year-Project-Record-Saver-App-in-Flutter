import 'package:flutter/material.dart';
import "package:fyp_recordsaver/Screens/database/user_authentication.dart";

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: passwordController,
        obscureText: _isHidden,
        validator: validatePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(Icons.lock),
          labelText: "Enter Password",
          hintText: "Password",
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: emailController,
        validator: validateEmail,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
          hintText: "gmail@.com",
        ),
      ),
    );
  }
}
