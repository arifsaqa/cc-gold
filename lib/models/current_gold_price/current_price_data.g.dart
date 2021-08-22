// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPriceData _$CurrentPriceDataFromJson(Map<String, dynamic> json) {
  return CurrentPriceData(
    id: json['id'] as int,
    price: json['price'] as int,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$CurrentPriceDataToJson(CurrentPriceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
