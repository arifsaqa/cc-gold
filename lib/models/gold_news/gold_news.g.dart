// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsRespon _$NewsResponFromJson(Map<String, dynamic> json) {
  return NewsRespon(
    articles: (json['articles'] as List<dynamic>)
        .map((dynamic e) => Article.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String,
    totalResults: json['totalResults'] as int,
  );
}

Map<String, dynamic> _$NewsResponToJson(NewsRespon instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
