import 'package:flutter/material.dart';

withBack({required BuildContext context,required Widget screen}){
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
}

withoutBack({required BuildContext context,required Widget screen}){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,));
}

bool containsUppercase(String value) {
  return value.contains(RegExp(r'[A-Z]'));
}

bool containsSymbol(String value) {
  return value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}
bool isEmailValid(String value) {
  // Regular expression to check email format
  // This is a basic example and might not cover all edge cases
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}