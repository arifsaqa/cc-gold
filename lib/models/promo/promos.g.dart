// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promos _$PromosFromJson(Map<String, dynamic> json) {
  return Promos(
    status: json['status'] as int,
    message: json['message'] as String,
    promos: (json['data'] as List<dynamic>)
        .map((e) => Promo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PromosToJson(Promos instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.promos,
    };
