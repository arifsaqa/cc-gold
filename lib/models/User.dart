// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) =>
    UserData.fromJson(json.decode(str) as Map<String, dynamic>);

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.status,
    this.user,
    this.token,
    this.isDeviceMatch,
  });

  dynamic status;
  User? user;
  dynamic token;
  dynamic isDeviceMatch;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        status: json["status"],
        user: User.fromJson(json["user"] as Map<String, dynamic>),
        token: json["token"],
        isDeviceMatch: json["isDeviceMatch"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "status": status,
        "user": user!.toJson(),
        "token": token,
        "isDeviceMatch": isDeviceMatch,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
    required this.isVerified,
    required this.deviceId,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic image;
  dynamic role;
  dynamic isVerified;
  dynamic deviceId;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        role: json["role"],
        isVerified: json["isVerified"],
        deviceId: json["deviceId"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"] as String),
        updatedAt: DateTime.parse(json["updated_at"] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "role": role,
        "isVerified": isVerified,
        "deviceId": deviceId,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
