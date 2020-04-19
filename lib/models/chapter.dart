import 'package:kajianapp/models/category.dart';
import 'package:kajianapp/models/content.dart';
import 'package:kajianapp/models/teacher.dart';

class Chapter {
  int id;
  String name;
  String createdAt;
  String image;
  String defaultSourceUrl;
  List<Content> contents;
  List<Category> categories;
  Teacher teacher;

  Chapter(
      {this.id,
      this.name,
      this.createdAt,
      this.image,
      this.defaultSourceUrl,
      this.contents,
      this.categories,
      this.teacher});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    image = json['image'];
    defaultSourceUrl = json['defaultSourceUrl'];
    if (json['contents'] != null) {
      contents = new List<Content>();
      json['contents'].forEach((v) {
        contents.add(new Content.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Category>();
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
    teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    data['defaultSourceUrl'] = this.defaultSourceUrl;
    if (this.contents != null) {
      data['contents'] = this.contents.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    return data;
  }
}
