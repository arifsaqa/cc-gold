// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Policy _$PolicyFromJson(Map<String, dynamic> json) {
  return Policy(
    id: json['id'] as int?,
    question: json['policy'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    isExpanded: json['isExpanded'] as bool?,
  );
}

Map<String, dynamic> _$PolicyToJson(Policy instance) => <String, dynamic>{
      'id': instance.id,
      'policy': instance.question,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'isExpanded': instance.isExpanded,
    };
