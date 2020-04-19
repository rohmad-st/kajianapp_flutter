class Category {
  int id;
  String name;
  String createdAt;
  bool isActive;

  Category({this.id, this.name, this.createdAt, this.isActive});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['isActive'] = this.isActive;
    return data;
  }
}
