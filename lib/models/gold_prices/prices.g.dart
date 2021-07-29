// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) {
  return Prices(
    status: json['status'] as int,
    message: json['message'] as String,
    price: (json['data'] as List<dynamic>)
        .map((dynamic e) => Price.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.price,
    };
