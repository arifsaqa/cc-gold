import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/user_points/user_points.dart';

part 'user_points_resp.g.dart';

@JsonSerializable()
class UserPointsResp {
  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'point')
  UserPoint? points;

  UserPointsResp({required this.status, this.points});
   factory UserPointsResp.fromJson(Map<String, dynamic> json) =>
      _$UserPointsRespFromJson(json);
  Map<String, dynamic> toJson() => _$UserPointsRespToJson(this);
}
