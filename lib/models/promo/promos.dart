import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/promo/promo.dart';
part 'promos.g.dart';

@JsonSerializable()
class Promos {
  @JsonKey(name: "status")
  int status;

  // @JsonKey(name: "message")
  // String message;

  @JsonKey(name: "data")
  List<Promo> promos;

  Promos({required this.status, required this.promos});
  factory Promos.fromJson(Map<String, dynamic> json) => _$PromosFromJson(json);
  Map<String, dynamic> toJson() => _$PromosToJson(this);
}
