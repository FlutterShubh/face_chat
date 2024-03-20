import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
   const FormButton({super.key,required this.buttonText,required this.color,required this.onTap,required this.width,required this.isLoading});
  final String buttonText;
  final Color color;
  final void Function() onTap;
  final double width;
  final bool isLoading;

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
        child: Center(child:isLoading?CircularProgressIndicator(): Text(buttonText,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
