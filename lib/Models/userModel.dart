class UserModel {
  String? name;
  String? email;
  String? uid;

  UserModel({this.email, this.name, this.uid});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'name': name};
  }
}
