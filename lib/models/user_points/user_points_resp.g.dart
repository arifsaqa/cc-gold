// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsResp _$UserPointsRespFromJson(Map<String, dynamic> json) {
  return UserPointsResp(
    status: json['status'] as int,
    points: json['point'] == null
        ? null
        : UserPoint.fromJson(json['point'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserPointsRespToJson(UserPointsResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'point': instance.points,
    };
