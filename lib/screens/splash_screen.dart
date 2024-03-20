import 'dart:async';

import 'package:face_chat/controllers/auth_controller.dart';
import 'package:face_chat/controllers/connection_controller.dart';
import 'package:face_chat/model/user_model.dart';
import 'package:face_chat/screens/connections_screen.dart';
import 'package:face_chat/screens/login_screen.dart';
import 'package:face_chat/services/firebase_services.dart';
import 'package:face_chat/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConnectionController connectionController = Get.put(ConnectionController());
  final AuthController authController = Get.put(AuthController());
  final user = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async{
      if(connectionController.isLogin.value == true){
        authController.onUserLogin(user ?? "", connectionController.userModel?.userName! ?? "");
        withoutBack(context: context, screen: const ConnectionsScreen());
      }else{
        withoutBack(context: context, screen: const LoginScreen());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Face-Chat",style: TextStyle(fontSize: 30,color: Colors.blue),),
            LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
