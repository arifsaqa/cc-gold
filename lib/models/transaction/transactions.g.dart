// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return Transactions(
    status: json['status'] as int,
    data: (json['data'] as List<dynamic>)
        .map((dynamic e) => Transaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
