import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/gold_prices/price.dart';
// {
//     "message": "success",
//     "data": [
//         {
//             "id": 1,
//             "price": 881452,
//             "created_at": "2021-07-29 16:02:28",
//             "updated_at": "2021-07-29 16:02:28"
//         }
//     ],
//     "status": 1
// }
part 'prices.g.dart';

@JsonSerializable()
class Prices {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  List<Price> price;

  Prices({required this.status, required this.message, required this.price});
  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);
  Map<String, dynamic> toJson() => _$PricesToJson(this);
}
