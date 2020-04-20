import 'package:http/http.dart' as http;
import 'package:kajianapp/models/Contents.dart';
import 'dart:convert';

String url(int chapterId) =>
    'https://kajianapp.herokuapp.com/api/v1/contents/$chapterId';

Future<Contents> getContents(int chapterId) async {
  final response = await http.get(url(chapterId));
  return Contents.fromJson(jsonDecode(response.body));
}
