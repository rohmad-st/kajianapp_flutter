import 'package:http/http.dart' as http;
import 'package:kajianapp/models/categories.dart';
import 'dart:convert';

final String url = 'https://kajianapp.herokuapp.com/api/v1/category';

Future<Categories> getCategories() async {
  final response = await http.get(url);
  return Categories.fromJson(jsonDecode(response.body));
}
