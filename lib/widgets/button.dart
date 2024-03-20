import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
   const FormButton({super.key,required this.buttonText,required this.color,required this.onTap,required this.width});
  final String buttonText;
  final Color color;
  final void Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        width:width ,
        height: 50,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(child: Text(buttonText,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
