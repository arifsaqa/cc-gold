// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodResponse _$PaymentMethodResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentMethodResponse(
    status: json['status'] as int,
    paymentMethods: (json['data'] as List<dynamic>)
        .map((dynamic e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$PaymentMethodResponseToJson(
        PaymentMethodResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.paymentMethods,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
