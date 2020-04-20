import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kajianapp/models/chapters.dart';

final String url = 'https://kajianapp.herokuapp.com/api/v1/chapter';

Future<Chapters> getChapters() async {
  final response = await http.get(url);
  return Chapters.fromJson(jsonDecode(response.body));
}

Future<Chapters> getChaptersByCategory(String categoryId) async {
  final response = await http.get('$url/category/$categoryId');
  return Chapters.fromJson(jsonDecode(response.body));
}
