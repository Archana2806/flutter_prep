import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../widgets/news_card.dart';
import '../models/article_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ArticleModel>> articles;

  @override
  void initState() {
    super.initState();
    articles = NewsService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latest News")),
      body: FutureBuilder<List<ArticleModel>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error fetching news"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return NewsCard(article: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}