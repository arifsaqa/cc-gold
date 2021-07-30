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
import 'package:learnUI/models/payment_methods/payment_method.dart';
part 'payment_method_response.g.dart';

@JsonSerializable()
class PaymentMethodResponse {
  @JsonKey(name: "status")
  int status;
  @JsonKey(name: "data")
  List<PaymentMethod> paymentMethods;

  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);

  PaymentMethodResponse({
    required this.status,
    required this.paymentMethods,
    required this.createdAt,
    required this.updatedAt,
  });
  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodResponseToJson(this);
}
