import 'package:flutter/material.dart';
import 'package:news_app/helpers/article_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/widgets/article_widget.dart';

class NewsCategory extends StatefulWidget {
  final String category;
  NewsCategory({this.category});

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<ArticleModel> articles;
  bool isLoading = true;

  getArticles() async {
    ArticleHelper articleHelper = ArticleHelper();
    await articleHelper.getArticle(category: "&category=" + widget.category);
    articles = articleHelper.articles;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App News"),
      ),
      body: isLoading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : Container(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleWidget(
                    url: articles[index].url,
                    urlToImage: articles[index].urlToImage,
                    title: articles[index].title,
                    description: articles[index].description,
                  );
                },
              ),
            ),
    );
  }
}
