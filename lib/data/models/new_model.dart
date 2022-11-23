import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/domain/entities/news_entity.dart';

class NewsModel extends News {
  const NewsModel(
      {super.id,
      required super.name,
      super.author,
      required super.title,
      super.description,
      required super.url,
      super.urlToImage,
      required super.publishedAt,
      super.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["source"]["id"] ?? AppString.nullId,
        name: json["source"]["name"],
        author: json["author"] ?? AppString.nullAuthor,
        title: json["title"],
        description: json["description"] ?? AppString.nullDescription,
        url: json["url"],
        urlToImage: json["urlToImage"] ?? AppString.nullImage,
        publishedAt: json["publishedAt"],
        content: json['content'] ?? AppString.nullContent,
      );
}
