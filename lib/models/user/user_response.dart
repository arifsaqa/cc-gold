import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/user/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'user')
  User? user;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'isDeviceMatch')
  bool isDeviceMatch;

  UserResponse(
      {required this.status,
      this.user,
      required this.token,
      required this.isDeviceMatch});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
