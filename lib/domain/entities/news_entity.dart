import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String? id;
  final String name;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  const News({
    this.id,
    required this.name,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
