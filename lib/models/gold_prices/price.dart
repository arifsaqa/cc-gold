import 'package:json_annotation/json_annotation.dart';
//  {
//             "id": 1,
//             "price": 881452,
//             "created_at": "2021-07-29 16:02:28",
//             "updated_at": "2021-07-29 16:02:28"
//         }
part 'price.g.dart';

@JsonSerializable()
class Price {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "price")
  int price;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt!);

  Price({
    required this.id,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
