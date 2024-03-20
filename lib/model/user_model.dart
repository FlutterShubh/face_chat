class UserModel {
  String? userID;
  String? userName;
  String? name;
  String? password;

  UserModel({required this.userName, required this.name, required this.password,required this.userID});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(userID: map["userID"],userName: map["userName"], name: map["name"], password: map["password"]);
  }

  Map<String, dynamic> toMap() {
    return {"userName": userName, "name": name, "password": password, "userID":userID};
  }
}
