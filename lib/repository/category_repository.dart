import 'package:http/http.dart' as http;
import 'package:kajianapp/models/category.dart';
import 'dart:convert';

Future<Stream<Category>> getCategories() async {
  final String url = 'https://kajianapp.herokuapp.com/api/v1/category';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Category.fromJSON(data));
}