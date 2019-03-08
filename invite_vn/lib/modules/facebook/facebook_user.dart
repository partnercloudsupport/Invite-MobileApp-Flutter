class FacebookUser {
  String id;
  String picture;
  String firstName;
  String lastName;
  String birthday;
  String gender;
  String accessToken;

  FacebookUser(
      {this.id,
      this.picture,
      this.firstName,
      this.lastName,
      this.birthday,
      this.gender});

  factory FacebookUser.fromJson(Map<String, dynamic> json) => FacebookUser(
        id: json['id'],
        picture: json['picture']['data']['url'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        birthday: json['birthday'],
        gender: json['gender'],
      );

  getImageUrl(String url) {
    RegExp exp = new RegExp(r"height=[\d]+&width=[\d]+");
    Match match = exp.firstMatch(url);
    url.replaceRange(match.start, match.end, "height=120&width=120");
  }

}
