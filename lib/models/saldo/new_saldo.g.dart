// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_saldo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewSaldoResponse _$NewSaldoResponseFromJson(Map<String, dynamic> json) {
  return NewSaldoResponse(
    status: json['status'] as int,
    saldo: json['saldo'] as int?,
  );
}

Map<String, dynamic> _$NewSaldoResponseToJson(NewSaldoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'saldo': instance.saldo,
    };
