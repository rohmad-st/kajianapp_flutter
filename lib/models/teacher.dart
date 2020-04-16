class Teacher {
  final int id;
  final String name;
  final String website;
  final String profile;
  final String location;
  final String sosmedYoutube;
  final String sosmedFacebook;
  final String sosmedInstagram;
  final String sosmedTwitter;
  final String createdAt;

  Teacher.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        website = jsonMap['website'],
        profile = jsonMap['profile'],
        location = jsonMap['location'],
        sosmedYoutube = jsonMap['sosmedYoutube'],
        sosmedFacebook = jsonMap['sosmedFacebook'],
        sosmedInstagram = jsonMap['sosmedInstagram'],
        sosmedTwitter = jsonMap['sosmedTwitter'],
        createdAt = jsonMap['createdAt'];
}
