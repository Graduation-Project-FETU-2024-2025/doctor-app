class UserModel {
  final String userName;
  final String userImage;

  UserModel({required this.userName, required this.userImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(userName: json['name'], userImage: json['picture']);
  }
}
