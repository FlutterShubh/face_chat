import 'package:face_chat/app_extentions.dart';
import 'package:face_chat/model/user_model.dart';
import 'package:face_chat/widgets/call_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConnectionDesign extends StatelessWidget {
  const ConnectionDesign({
    super.key,
    required this.space,
    required this.model,
    required this.onCallFinished,
  });

  final double space;
  final UserModel model;
  final void Function(String code, String message, List<String>)?
      onCallFinished;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff202020).withOpacity(0.7),
          borderRadius: BorderRadius.circular(20)
        ),
        height: context.screenHeight()/8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  model.name ?? "Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: callButton(
                      id: model.userID!,
                      userName: model.userName!,
                      isVideo: false,
                      onCallFinished: onCallFinished)),
              Expanded(
                  flex: 1,
                  child: callButton(
                      id: model.userID!,
                      userName: model.userName!,
                      isVideo: true,
                      onCallFinished: onCallFinished)),
            ],
          ),
        ),
      ),
    );
  }
}
