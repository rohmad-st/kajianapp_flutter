import 'package:kajianapp/models/content.dart';

class Contents {
  List<Content> contents;

  Contents({this.contents});

  Contents.fromJson(List<dynamic> parsedJson) {
    contents = new List<Content>();
    parsedJson.forEach(
      (chapter) {
        contents.add(Content.fromJson(chapter));
      },
    );
  }
}
