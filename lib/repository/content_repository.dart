import 'package:http/http.dart' as http;
import 'package:kajianapp/models/content.dart';
import 'dart:convert';

Future<Stream<Content>> getContents(int chapterId) async {
  final String url =
      'https://kajianapp.herokuapp.com/api/v1/contents/${chapterId}';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) {
    return Content.fromJSON(data);
  });
}
