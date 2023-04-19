import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String url;
  final String? urlToImage;
  final String imageHash;
  final String title;
  final String publishedAt;

  const ArticleModel(this.url, this.urlToImage, this.title, this.publishedAt,
      {this.imageHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I'});

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
