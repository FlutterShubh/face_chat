import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

ZegoSendCallInvitationButton callButton(
    {required bool isVideo ,required String id, required String userName,required void Function(String code, String message, List<String>)? onCallFinished,}) {
  return ZegoSendCallInvitationButton(
    isVideoCall: isVideo,
    resourceID: "zego_call",
    //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
    invitees: [
      ZegoUIKitUser(
        id: id,
        name: userName,
      ),
    ],
    onPressed: onCallFinished,
  );
}
