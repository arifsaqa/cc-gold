import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;
  //  "id": 1,

  @JsonKey(name: 'name')
  String name;

  //  "name": "Syamsul Arifin",

  @JsonKey(name: 'email')
  //  "email": "arifsaqa@gmail.com",
  String email;

  @JsonKey(name: 'phone')
  String phone;
  //  "phone": "0895352530708",

  @JsonKey(name: 'image')
  String image;
  //  "image": "tt.png",

  @JsonKey(name: 'role')
  int role;
  //  "role": 0,

  @JsonKey(name: 'isVerified')
  int isVerified;
  //  isVerified": 0,

  @JsonKey(name: 'deviceId')
  String deviceId;
  //  "deviceId": "deviceId",

  @JsonKey(name: 'created_at')
  String createdAt;
  //  "created_at": "2021-07-24T07:14:03.000000Z",
  //  "email_verified_at": null,

  @JsonKey(name: 'updated_at')
  String updatedAt;
  //  "updated_at": "2021-07-24T07:22:33.000000Z"

  User({
    required this.name,
    required this.isVerified,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.role,
    required this.deviceId,
    required this.createdAt,
    required this.updatedAt,
  });

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
