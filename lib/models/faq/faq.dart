// id 	question 	answer 	created_at 	updated_at

import 'package:json_annotation/json_annotation.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "question")
  String question;

  @JsonKey(name: "answer")
  String answer;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  bool isExpanded = false;
  Faq(
      {required this.id,
      required this.question,
      required this.answer,
      required this.createdAt,
      required this.updatedAt,
      required this.isExpanded});
  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);
  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
