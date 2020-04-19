import 'package:kajianapp/models/chapter.dart';

class Chapters {
  List<Chapter> chapters;

  Chapters({this.chapters});

  Chapters.fromJson(List<dynamic> parsedJson) {
    chapters = new List<Chapter>();
    parsedJson.forEach(
      (chapter) {
        chapters.add(Chapter.fromJson(chapter));
      },
    );
  }
}
