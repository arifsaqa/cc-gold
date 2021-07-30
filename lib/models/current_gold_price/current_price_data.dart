import 'package:json_annotation/json_annotation.dart';

part 'current_price_data.g.dart';

@JsonSerializable()
class CurrentPriceData {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "price")
  int price;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  CurrentPriceData(
      {required this.id,
      required this.price,
      required this.createdAt,
      required this.updatedAt});
  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);
  factory CurrentPriceData.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceDataFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPriceDataToJson(this);
}
