import 'package:flutter/material.dart';
import '../models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  NewsCard({required this.article});

  void openArticle() async {
    if (await canLaunch(article.url)) {
      await launch(article.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        title: Text(article.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(article.source, style: TextStyle(color: Colors.grey)),
        trailing: IconButton(icon: Icon(Icons.open_in_new), onPressed: openArticle),
      ),
    );
  }
}