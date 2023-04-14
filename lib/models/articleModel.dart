import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String url;
  final String? urlToImage;
  final String title;
  final String publishedAt;

  ArticleModel(this.url, this.urlToImage, this.title, this.publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      json['url'],
      json['urlToImage'],
      json['title'],
      json['publishedAt'],
    );
  }

  @override
  List<Object> get props => [
        url,
        title,
        publishedAt,
      ];
}
