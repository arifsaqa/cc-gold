// {
//     "status": 1,
//     "point": {
//         "id": 2,
//         "point": 0,
//         "userId": 29,
//         "created_at": "2021-08-25T09:51:23.000000Z",
//         "updated_at": "2021-08-25T09:51:23.000000Z"
//     }
// }

import 'package:json_annotation/json_annotation.dart';

part 'user_points.g.dart';

@JsonSerializable()
class UserPoint {
  @JsonKey(name: 'point')
  int point;

  UserPoint({required this.point});
     factory UserPoint.fromJson(Map<String, dynamic> json) =>
      _$UserPointFromJson(json);
  Map<String, dynamic> toJson() => _$UserPointToJson(this);
}
