// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promos _$PromosFromJson(Map<String, dynamic> json) {
  return Promos(
    status: json['status'] as int,
    promos: (json['data'] as List<dynamic>)
        .map((e) => Promo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PromosToJson(Promos instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.promos,
    };
