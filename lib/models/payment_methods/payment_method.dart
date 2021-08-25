// {
//     "status": 1,
//     "data": {
//         "name": "BRI",
//         "logo": "public/images/paymen-method/20210730132627.png",
//         "updated_at": "2021-07-30T13:27:26.000000Z",
//         "created_at": "2021-07-30T13:27:26.000000Z",
//         "id": 1
//     }
// }

import 'package:json_annotation/json_annotation.dart';
part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "logo")
  String logo;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);

  PaymentMethod({
    required this.id,
    required this.name,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });
  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
