// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccounts _$BankAccountsFromJson(Map<String, dynamic> json) {
  return BankAccounts(
    status: json['status'] as int,
    bankAccounts: (json['data'] as List<dynamic>?)
        ?.map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BankAccountsToJson(BankAccounts instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.bankAccounts,
    };
