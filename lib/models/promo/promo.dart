import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
// "id": 1,
//           "title": "Promo Pertama",
//           "description": "Promo ini bukanlah promo biasa",
//           "image": "images/promo/20210727101313.png",
//           "created_at": "2021-07-27 10:14:24",
//           "updated_at": "2021-07-27 10:14:24"
part 'promo.g.dart';

@JsonSerializable()
class Promo {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "discount")
  int discount;

  // @JsonKey(name: "userList")
  // List<dynamic>? userList;

  @JsonKey(name: "created_at")
  String createdAt;

  @JsonKey(name: "updated_at")
  String updatedAt;

  DateTime? get getCreateAt => DateTime.tryParse(createdAt);
  DateTime? get getUpdateAt => DateTime.tryParse(updatedAt);

  Promo(
      {required this.id,
      required this.title,
      required this.image,
      // required this.userList,
      required this.createdAt,
      required this.updatedAt,
      required this.discount,
      this.description});
  factory Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);
  Map<String, dynamic> toJson() => _$PromoToJson(this);
}
