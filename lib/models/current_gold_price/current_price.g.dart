// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPrice _$CurrentPriceFromJson(Map<String, dynamic> json) {
  return CurrentPrice(
    status: json['status'] as int,
    message: json['message'] as String,
    price: CurrentPriceData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrentPriceToJson(CurrentPrice instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.price,
    };
