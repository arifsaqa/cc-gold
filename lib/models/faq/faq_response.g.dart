// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) {
  return FaqResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => Faq.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FaqResponseToJson(FaqResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
