import 'package:flutter/material.dart';
import 'package:news_app/helpers/article_helper.dart';
import 'package:news_app/helpers/category_helper.dart';
import 'package:news_app/helpers/new_article_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/widgets/article_widget.dart';
import 'package:news_app/views/widgets/category_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  // * biar nanti saat data sudah didapatkan maka statusnya berubah menjadi false;
  List<CategoryModel> categories;
  List<ArticleModel> articles;
  List<NewArticleHelper> newArticles; // USELESS

  void getCategory() {
    CategoryHelper categoryHelper = CategoryHelper();
    categoryHelper.getCategory();
    categories = categoryHelper.categories;
  }

  Future<void> getArticle() async {
    ArticleHelper articleHelper = ArticleHelper();
    await articleHelper.getArticle(category: "");
    articles = articleHelper.articles;
    setState(() {
      isLoading = false;
    });
  }

  // USELESS
  Future getNewArticles() async {
    newArticles = await NewArticleHelper().connectToApi();
  }

  @override
  void initState() {
    super.initState();
    getCategory();
    getArticle();
    getNewArticles(); // USELESS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App News"),
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      // * LIST OF CATEGORY (HORIZONTAL)
                      Container(
                        height: 76,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              name: categories[index].name,
                            );
                          },
                        ),
                      ),
                      // * LIST OF NEWS / ARTICLES(VERTICAL)
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
