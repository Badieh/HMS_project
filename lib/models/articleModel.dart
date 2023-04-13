
class ArticleModel {
  String url;
  String? urlToImage;
  String title;
  String publishedAt;

  ArticleModel(this.url, this.urlToImage, this.title, this.publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      json['url'],
      json['urlToImage'],
      json['title'],
      json['publishedAt'],
    );
  }
}
