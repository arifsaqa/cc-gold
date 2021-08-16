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

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

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
