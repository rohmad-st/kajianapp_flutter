import 'package:kajianapp/models/teacher.dart';

class Chapter {
  final int id;
  final String name;
  final String createdAt;
  final Teacher teacher;

  Chapter.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        createdAt = jsonMap['createdAt'],
        teacher = Teacher.fromJSON(jsonMap['teacher']);
}
