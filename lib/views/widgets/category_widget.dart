import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/news_category.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  CategoryWidget({this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NewsCategory(category: name));
      },
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 60,
            margin: EdgeInsets.all(16),
            color: Colors.black12,
            child: Center(
              child: Text(name),
            ),
          ),
        ],
      ),
    );
  }
}
