import 'package:json_annotation/json_annotation.dart';
import 'package:learnUI/models/gold_news/article.dart';

part 'gold_news.g.dart';

@JsonSerializable()
class NewsRespon {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int totalResults;

  @JsonKey(name: "articles")
  List<Article> articles;

  NewsRespon({
    required this.articles,
    required this.status,
    required this.totalResults,
  });

  factory NewsRespon.fromJson(Map<String, dynamic> json) =>
      _$NewsResponFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponToJson(this);
}
