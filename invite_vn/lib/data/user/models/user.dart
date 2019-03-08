class User {
  String id;
  String facebookId;
  String accessToken;
  int tokenVersion;
  String notificationKey;
  String imageUrl;
  String firstName;
  String lastName;
  String birthday;
  int gender; // 0: Male, 1: Female, 2: Other
  String createdAt;
  String updatedAt;


  User({
    this.id,
    this.facebookId,
    this.accessToken,
    this.tokenVersion,
    this.notificationKey,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.birthday,
    this.gender,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        facebookId = json['facebook_id'],
        accessToken = json['access_token'],
        tokenVersion = json['token_version'],
        notificationKey = json['notification_key'],
        imageUrl = json['image_url'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        birthday = json['birthday'],
        gender = json['gender'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'facebook_id': facebookId,
        'access_token': accessToken,
        'token_version': tokenVersion,
        'notification_key': notificationKey,
        'image_url': imageUrl,
        'first_name': firstName,
        'last_name': lastName,
        'birthday': birthday,
        'gender': gender,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
