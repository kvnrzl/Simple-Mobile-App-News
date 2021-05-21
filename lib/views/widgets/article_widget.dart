import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/article_view.dart';

class ArticleWidget extends StatelessWidget {
  final String url, urlToImage, title, description;
  ArticleWidget({this.url, this.urlToImage, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ArticleView(url: url));
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(urlToImage),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(description),
          ],
        ),
      ),
    );
  }
}
