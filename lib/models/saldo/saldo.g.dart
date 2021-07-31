// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saldo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Saldo _$SaldoFromJson(Map<String, dynamic> json) {
  return Saldo(
    id: json['id'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    userId: json['userId'] as int,
    gram: json['gram'] as int,
  );
}

Map<String, dynamic> _$SaldoToJson(Saldo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'gram': instance.gram,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
