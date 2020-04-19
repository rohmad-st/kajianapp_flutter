import 'package:kajianapp/models/category.dart';

class Categories {
  List<Category> categories;

  Categories({this.categories});

  Categories.fromJson(List<dynamic> parsedJson) {
    categories = new List<Category>();
    parsedJson.forEach(
      (chapter) {
        categories.add(Category.fromJson(chapter));
      },
    );
  }
}
