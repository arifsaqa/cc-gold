// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saldo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaldoResponse _$SaldoResponseFromJson(Map<String, dynamic> json) {
  return SaldoResponse(
    status: json['status'] as int,
    saldo: json['saldo'] == null
        ? null
        : Saldo.fromJson(json['saldo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaldoResponseToJson(SaldoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'saldo': instance.saldo,
    };
