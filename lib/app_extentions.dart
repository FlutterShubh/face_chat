import 'package:flutter/material.dart';

extension ScreenProperties on BuildContext{
  double screenWidth(){
    return MediaQuery.of(this).size.width;
  }
  double screenHeight(){
    return MediaQuery.of(this).size.height;
  }
  MediaQueryData mediaQuery(){
    return MediaQuery.of(this);
  }
}