
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_chat/firebase_options.dart';
import 'package:face_chat/model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class FirebaseServices {
  static initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

  }
   User? get user => FirebaseAuth.instance.currentUser;
  static FirebaseAuth get auth => FirebaseAuth.instance;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  static Future<UserCredential?> signUp({required String email, required String password}) async {
    try {
     return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<UserCredential?> signIn({required String email, required String password}) async {
    try {
     return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<void> insertUser({required UserModel user})async{
    try {
   await FirebaseFirestore.instance.collection("connections").doc(user.userID!).set(user.toMap());
    } on Exception catch (e) {
     log(e.toString());
    }
  }



 static Stream<List<UserModel>> getAllUsersStream() {
    return FirebaseFirestore.instance.collection("connections").snapshots().map((querySnapshot) {
      List<UserModel> users = [];
      for (var userDoc in querySnapshot.docs) {
          users.add(UserModel.fromMap(userDoc.data()));
      }
      return users;
    });
  }

  static Future<UserModel?> getCurrentUser(String id)async{
    var data = await FirebaseFirestore.instance.collection("connections").doc(id).get();
    
    return data.exists? UserModel.fromMap(data.data()!):null;
  }

  static Future<void> updateCallId({required String userID,required String callId})async{
    try{
      await FirebaseFirestore.instance.collection("connections").doc(userID).update({"callId": callId});
    }catch(e){
      Get.showSnackbar(GetSnackBar(message: "$e",));
    }
  }

}
