class Content {
  int id;
  String name;
  String sourceUrl;
  String description;
  int order;
  String createdAt;

  Content(
      {this.id,
      this.name,
      this.sourceUrl,
      this.description,
      this.order,
      this.createdAt});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sourceUrl = json['sourceUrl'];
    description = json['description'];
    order = json['order'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sourceUrl'] = this.sourceUrl;
    data['description'] = this.description;
    data['order'] = this.order;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
