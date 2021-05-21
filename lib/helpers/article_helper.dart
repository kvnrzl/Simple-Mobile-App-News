import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleHelper {
  List<ArticleModel> articles = [];

  // * Biar ga bikin helper baru lagi, disini ditambahin parameter category nya
  Future<void> getArticle({String category}) async {
    String apiUrl = "https://newsapi.org/v2/top-headlines?country=id" +
        category +
        "&apiKey=16e9ed0a8baf4982939bd223967794cc";
    var response = await http.get(apiUrl);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt: element["publishedAt"],
            content: element["content"],
          );
          articles.add(articleModel);
        }
      });
    }

    // // * Cek dulu jika status nya ok maka diambil beritanya
    // if (jsonData["status"] == "ok") {
    //   // * Lakukan perulangan untuk setiap element pada key "articles"
    //   jsonData["articles"].forEach((element) {
    //     if (element["urlToImage"] != null && element["description"] != null) {
    //       ArticleModel articleModel = ArticleModel(
    //         author: element["author"],
    //         title: element["title"],
    //         description: element["description"],
    //         url: element["url"],
    //         urlToImage: element["urlToImage"],
    //         publishedAt: element["publishedAt"],
    //         content: element["content"],
    //       );

    //       articles.add(articleModel);
    //     }
    //   });
    // }
  }
}
