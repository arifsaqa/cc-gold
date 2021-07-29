// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promo _$PromoFromJson(Map<String, dynamic> json) {
  return Promo(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$PromoToJson(Promo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
