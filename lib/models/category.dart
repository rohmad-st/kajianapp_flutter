class Category {
  final int id;
  final String name;
  final String createdAt;

  Category.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        createdAt = jsonMap['createdAt'];
}
