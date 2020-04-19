class Teacher {
  int id;
  String name;
  String website;
  String profile;
  String location;
  String sosmedFacebook;
  String sosmedYoutube;
  String sosmedInstagram;
  String sosmedTwitter;
  String createdAt;

  Teacher(
      {this.id,
      this.name,
      this.website,
      this.profile,
      this.location,
      this.sosmedFacebook,
      this.sosmedYoutube,
      this.sosmedInstagram,
      this.sosmedTwitter,
      this.createdAt});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    website = json['website'];
    profile = json['profile'];
    location = json['location'];
    sosmedFacebook = json['sosmedFacebook'];
    sosmedYoutube = json['sosmedYoutube'];
    sosmedInstagram = json['sosmedInstagram'];
    sosmedTwitter = json['sosmedTwitter'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['website'] = this.website;
    data['profile'] = this.profile;
    data['location'] = this.location;
    data['sosmedFacebook'] = this.sosmedFacebook;
    data['sosmedYoutube'] = this.sosmedYoutube;
    data['sosmedInstagram'] = this.sosmedInstagram;
    data['sosmedTwitter'] = this.sosmedTwitter;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
