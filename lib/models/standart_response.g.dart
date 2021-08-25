// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandartResponse _$StandartResponseFromJson(Map<String, dynamic> json) {
  return StandartResponse(
    status: json['status'] as int,
    message: json['point'] as String?,
  );
}

Map<String, dynamic> _$StandartResponseToJson(StandartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'point': instance.message,
    };
