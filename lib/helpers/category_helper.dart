import 'package:news_app/models/category_model.dart';

class CategoryHelper {
  List<CategoryModel> categories = [];
  void getCategory() {
    CategoryModel business = CategoryModel();
    business.name = "business";
    categories.add(business);

    CategoryModel entertainment = CategoryModel();
    entertainment.name = "entertainment";
    categories.add(entertainment);

    CategoryModel health = CategoryModel();
    health.name = "health";
    categories.add(health);

    CategoryModel science = CategoryModel();
    science.name = "science";
    categories.add(science);

    CategoryModel sports = CategoryModel();
    sports.name = "sports";
    categories.add(sports);

    CategoryModel technology = CategoryModel();
    technology.name = "technology";
    categories.add(technology);
  }
}
