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

part 'saldo.g.dart';

@JsonSerializable()
class Saldo {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "gram")
  int gram;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);

  Saldo(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.userId,
      required this.gram});
  factory Saldo.fromJson(Map<String, dynamic> json) => _$SaldoFromJson(json);
  Map<String, dynamic> toJson() => _$SaldoToJson(this);
}
