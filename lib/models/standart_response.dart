import 'package:json_annotation/json_annotation.dart';

part 'standart_response.g.dart';

@JsonSerializable()
class StandartResponse {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'point')
  String? message;

  StandartResponse({required this.status, this.message});
  factory StandartResponse.fromJson(Map<String, dynamic> json) =>
      _$StandartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StandartResponseToJson(this);
}
