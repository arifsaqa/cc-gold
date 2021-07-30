import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

// {
//     "source": {
//         "id": "reuters",
//         "name": "Reuters"
//     },
//     "author": "Nakul Iyer",
//     "title": "PRECIOUS-Gold jumps over 1% as Powell strikes dovish tone - Reuters",
//     "description": "Gold jumped more than 1% on Thursday as investors cheered U.S. Federal Reserve Chairman Jerome Powell's comments that the central bank was unlikely to hike rates anytime soon.",
//     "url": "https://www.reuters.com/article/global-precious-idUSL4NJP51V7",
//     "urlToImage": "https://s1.reutersmedia.net/resources_v2/images/rcom-default.png?w=800",
//     "publishedAt": "2021-07-29T14:28:00Z",
//     "content": "(Recasts, adds comment and updates prices)\r\n* Dollar slips to one-month low\r\n* Silver hits highest since July 19\r\n* Golds rally could be more sustained- analyst\r\nJuly 29 (Reuters) - Gold jumped more … [+1825 chars]"
// },
@JsonSerializable()
class Article {
  @JsonKey(name: "author")
  String author;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "urlToImage")
  String urlToImage;

  @JsonKey(name: "publishedAt")
  String publishedAt;

  DateTime? get getCreateAt => DateTime.tryParse(publishedAt);

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
