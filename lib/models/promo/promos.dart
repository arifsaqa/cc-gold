import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/promo/promo.dart';
// {
//     "data": [
//         {
//             "id": 1,
//             "title": "Promo Pertama",
//             "data": "Promo ini bukanlah promo biasa",
//             "image": "images/promo/20210727101313.png",
//             "created_at": "2021-07-27 10:14:24",
//             "updated_at": "2021-07-27 10:14:24"
//         }
//     ],
//     "status": 1,
//     "message": "sukses"
// }
part 'promos.g.dart';

@JsonSerializable()
class Promos {
  @JsonKey(name: "status")
  int status;

  // @JsonKey(name: "message")
  // String message;

  @JsonKey(name: "data")
  List<Promo> promos;

  Promos({required this.status, required this.promos});
  factory Promos.fromJson(Map<String, dynamic> json) => _$PromosFromJson(json);
  Map<String, dynamic> toJson() => _$PromosToJson(this);
}
