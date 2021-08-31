// id 	question 	answer 	created_at 	updated_at

import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/policy/policy.dart';

part 'policy_response.g.dart';

@JsonSerializable()
class PolicyResponse {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  List<Policy> data;

  PolicyResponse(
      {required this.status, required this.message, required this.data});
  factory PolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PolicyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PolicyResponseToJson(this);
}
