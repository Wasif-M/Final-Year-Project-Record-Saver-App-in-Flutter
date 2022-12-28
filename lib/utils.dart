import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utils {
 void toastMessage(){
   Fluttertoast.showToast(
       msg: "Email or Password is invalid7",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
 }
}