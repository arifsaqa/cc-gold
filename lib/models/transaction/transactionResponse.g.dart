// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse(
    status: json['status'] as int,
    data: Transaction.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
