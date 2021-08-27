// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_numbers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberResponse _$PhoneNumberResponseFromJson(Map<String, dynamic> json) {
  return PhoneNumberResponse(
    status: json['status'] as int,
    phoneNumbers:
        (json['data'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PhoneNumberResponseToJson(
        PhoneNumberResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.phoneNumbers,
    };
