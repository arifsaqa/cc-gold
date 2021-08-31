// id 	question 	answer 	created_at 	updated_at

import 'package:json_annotation/json_annotation.dart';

part 'policy.g.dart';

@JsonSerializable()
class Policy {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "policy")
  String? question;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;
  bool? isExpanded = false;
  Policy(
      {this.id,
      this.question,
      this.createdAt,
      this.updatedAt,
      this.isExpanded});
  DateTime? get getCreateAt => DateTime.tryParse(createdAt!);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt!);
  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);
  Map<String, dynamic> toJson() => _$PolicyToJson(this);
}
