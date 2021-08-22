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

part 'new_saldo.g.dart';

@JsonSerializable()
class NewSaldoResponse {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "saldo")
  int? saldo;

  NewSaldoResponse({
    required this.status,
    required this.saldo,
  });
  factory NewSaldoResponse.fromJson(Map<String, dynamic> json) => _$NewSaldoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewSaldoResponseToJson(this);
}
