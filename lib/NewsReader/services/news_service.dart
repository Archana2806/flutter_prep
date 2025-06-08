import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class NewsService {
  static const String apiKey = "a31d502f903d43928910d165fd814e05";
  static const String apiUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

  static Future<List<ArticleModel>> fetchNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["articles"];
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch news");
    }
  }
}