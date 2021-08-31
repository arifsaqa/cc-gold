// id 	question 	answer 	created_at 	updated_at

import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/faq/faq.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FaqResponse {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  List<Faq> data;
// {"status":1,
//"message":"berhasil mendapatkan data",
//"data":[
//{"id":1,"question":"Aku siapa ?","answer":"Gatau","created_at":"2021-09-01T00:38:52.000000Z","updated_at":"2021-09-01T00:38:52.000000Z"},
//{"id":3,"question":"Aku siapa ?","answer":"Mboh","created_at":"2021-09-01T00:38:52.000000Z","updated_at":"2021-09-01T00:38:52.000000Z"}
//]
//}

  FaqResponse({
    required this.status,
    required this.message,
    required this.data,
  });
  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
}
