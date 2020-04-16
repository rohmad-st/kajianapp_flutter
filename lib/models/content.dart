class Content {
  final int id;
  final String name;
  final String sourceUrl;
  final String description;
  final int order;
  final String createdAt;

  Content.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        sourceUrl = jsonMap['sourceUrl'],
        description = jsonMap['description'],
        order = jsonMap['order'],
        createdAt = jsonMap['createdAt'];
}
