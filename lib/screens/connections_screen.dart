import 'package:face_chat/app_extentions.dart';
import 'package:face_chat/controllers/auth_controller.dart';
import 'package:face_chat/controllers/connection_controller.dart';
import 'package:face_chat/model/user_model.dart';
import 'package:face_chat/screens/login_screen.dart';
import 'package:face_chat/services/firebase_services.dart';
import 'package:face_chat/widgets/connections_design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConnectionsScreen extends StatefulWidget {
  const ConnectionsScreen({super.key});

  @override
  State<ConnectionsScreen> createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Connections"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              FutureBuilder(
                future: FirebaseServices.getCurrentUser(
                    FirebaseAuth.instance.currentUser?.uid ?? ""),
                builder: (context, snapshot) => UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Text(
                        snapshot.data?.name![0].toUpperCase() ?? "A",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.blue),
                      ),
                    ),
                    accountName: Text(snapshot.data?.name ?? "Name"),
                    accountEmail: Text((snapshot.data?.userName ?? "Email"))),
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("Logout"),
                        content: Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(onPressed: () {
                            Get.back();
                          }, child: Text("No")),
                          TextButton(onPressed: () {
                            FirebaseServices.auth.signOut().then((value) {
                              authController.onUserLogout();
                              Get.offAll(() => LoginScreen());
                            });
                            Get.back();
                          }, child: Text("Yes")),
                        ],
                      );
                    },);

                  })
            ],
          ),
        ),
        body: StreamBuilder<List<UserModel>>(
          stream: FirebaseServices.getAllUsersStream(),
          // Replace with your actual stream function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Show a loading indicator while data is being fetched
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No users found.'),
              ); // Display a message if no users are available
            } else {
              // Display your UI components using the user data (snapshot.data)
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  if (FirebaseServices().userId != user.userID) {
                    return ConnectionDesign(
                        space: context.screenWidth() * 0.03,
                        model: user,
                        onCallFinished:
                            authController.onSendCallInvitationFinished);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ));
  }
}
