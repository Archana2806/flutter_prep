class ArticleModel {
  final String title;
  final String source;
  final String url;

  ArticleModel({
    required this.title,
    required this.source,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] ?? "No Title",
      source: json["source"]["name"] ?? "Unknown Source",
      url: json["url"] ?? "",
    );
  }
}