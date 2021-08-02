// "user": {
//     "id": 1,
//     "name": "Syamsul Arifin",
//     "email": "arifsaqa@gmail.com",
//     "phone": "0895352530708",
//     "image": "tt.png",
//     "role": 0,
//     "isVerified": 0,
//     "deviceId": "deviceId",
//     "email_verified_at": null,
//     "created_at": "2021-07-24T07:14:03.000000Z",
//     "updated_at": "2021-07-24T07:22:33.000000Z"
// },
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'role')
  int role;

  @JsonKey(name: 'isVerified')
  int isVerified;

  @JsonKey(name: 'deviceId')
  String deviceId;

  @JsonKey(name: 'email_verified_at')
  String? email_verified_at;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  User(
      {required this.name,
      required this.isVerified,
      required this.phone,
      required this.email,
      required this.id,
      required this.image,
      required this.role,
      required this.deviceId,
      required this.createdAt,
      required this.updatedAt,
      this.email_verified_at});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
