// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) {
  return Faq(
    id: json['id'] as int,
    question: json['question'] as String,
    answer: json['answer'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    isExpanded: json['isExpanded'] == null ? false : json['isExpanded'] as bool,
  );
}

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'isExpanded': instance.isExpanded,
    };
