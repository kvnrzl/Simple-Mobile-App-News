import 'dart:convert';

import 'package:http/http.dart' as http;

class NewArticleHelper {
  String author, title, description, url, urlToImage, publishedAt, content;
  NewArticleHelper(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewArticleHelper.create(Map<String, dynamic> object) {
    return NewArticleHelper(
      author: object["author"],
      title: object["title"],
      description: object["description"],
      url: object["url"],
      urlToImage: object["urlToImage"],
      publishedAt: object["publishedAt"],
      content: object["content"],
    );
  }

  Future<List<NewArticleHelper>> connectToApi() async {
    String apiUrl =
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=16e9ed0a8baf4982939bd223967794cc';
    var response = await http.get(apiUrl);
    var jsonData = jsonDecode(response.body);

    List<dynamic> dynamicArticle =
        (jsonData as Map<String, dynamic>)["articles"];
    List<NewArticleHelper> articles = [];
    for (int i = 0; i < dynamicArticle.length; i++) {
      articles.add(NewArticleHelper.create(dynamicArticle[i]));
    }
    return articles;
  }
}
