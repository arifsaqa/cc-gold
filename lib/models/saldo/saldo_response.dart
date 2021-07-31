// {
//     "status": 1,
//     "saldo": {
//         "id": 1,
//         "userId": 1,
//         "gram": 10,
//         "created_at": "2021-07-31T13:17:00.000000Z",
//         "updated_at": "2021-07-31T13:17:00.000000Z"
//     }
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/saldo/saldo.dart';

part 'saldo_response.g.dart';

@JsonSerializable()
class SaldoResponse {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "saldo")
  Saldo? saldo;

  SaldoResponse({
    required this.status,
    required this.saldo,
  });
  factory SaldoResponse.fromJson(Map<String, dynamic> json) =>
      _$SaldoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SaldoResponseToJson(this);
}
