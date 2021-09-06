import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/current_gold_price/current_price_data.dart';

part 'current_price.g.dart';

@JsonSerializable()
class CurrentPrice {
  @JsonKey(name: "status")
  int status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "data")
  CurrentPriceData price;

  @JsonKey(name: "diff")
  double diff;
  CurrentPrice(
      {required this.status,
      required this.message,
      required this.price,
      required this.diff});
  factory CurrentPrice.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPriceToJson(this);
}
