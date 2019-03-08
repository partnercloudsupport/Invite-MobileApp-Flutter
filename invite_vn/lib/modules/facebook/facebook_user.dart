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
        birthday: _formatBirthday(json['birthday']),
        gender: json['gender'],
      );

  static String _formatBirthday(String birthday) {
    final pattern = "/";
    final values = birthday.split(pattern);
    String temp = values[0];
    values[0] = values[1];
    values[1] = temp;
    return values.join(pattern);
  }
}
