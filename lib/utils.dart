import 'package:flutter/material.dart';

withBack({required BuildContext context,required Widget screen}){
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
}

withoutBack({required BuildContext context,required Widget screen}){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen,));
}