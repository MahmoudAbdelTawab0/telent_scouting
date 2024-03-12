import 'package:flutter/material.dart';
import 'package:news_api/news_model/NewsModel.dart';
import 'package:news_api/screens/HomeScreen.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
        body: Container(
      margin: EdgeInsets.all(12),
      child: ListView(
        children: [
          Container(
            child: Image.network(
              article.urlToImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOkKOoQa_jUfgarICXe-K2c_lCVZ47CVCIaIeBC0ZGfg&s",
            ),
          ),
          ListTile(
            title: Text(article.author ?? ""),
            subtitle: Text(article.publishedAt.toString()),
          ),
          Text(article.description ?? "No Description")
        ],
      ),
    ));
  }
}
