// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyResponse _$PolicyResponseFromJson(Map<String, dynamic> json) {
  return PolicyResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => Policy.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PolicyResponseToJson(PolicyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
