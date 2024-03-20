import 'dart:async';
import 'dart:developer';

import 'package:face_chat/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../model/user_model.dart';

class ConnectionController extends GetxController {
  RxBool isLogin = false.obs;
  UserModel? userModel;
  @override
  void onInit() {
    isLogin.value = FirebaseServices().user != null ? true : false;
    FirebaseServices.getCurrentUser(FirebaseAuth.instance.currentUser?.uid??"").then((value) => userModel=value!);
    super.onInit();
  }




}
