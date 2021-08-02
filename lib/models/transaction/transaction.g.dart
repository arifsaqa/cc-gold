// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    id: json['id'] as int,
    adminFee: json['adminFee'] as int,
    barcode: json['barcode'] as String,
    discount: json['discount'] as int,
    gram: json['gram'] as int,
    destinationNumber: json['destinationNumber'] as String?,
    message: json['message'] as String?,
    nominal: json['nominal'] as int,
    type: json['type'] as int,
    createdAt: json['created_at'] as String,
    priceId: json['priceId'] as int,
    status: json['status'] as int,
    updatedAt: json['updated_at'] as String,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'gram': instance.gram,
      'priceId': instance.priceId,
      'adminFee': instance.adminFee,
      'nominal': instance.nominal,
      'status': instance.status,
      'discount': instance.discount,
      'barcode': instance.barcode,
      'destinationNumber': instance.destinationNumber,
      'message': instance.message,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
