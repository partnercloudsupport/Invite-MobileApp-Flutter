import 'package:invite_vn/data/user/dtos/user_response.dart';
import 'package:invite_vn/data/user/models/user.dart';

class LoginUserResponse extends UserResponse {
  User user;

  LoginUserResponse({
    String error,
    this.user,
  }) : super(error: error);

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      LoginUserResponse(
        error: json['error'],
        user: User.fromJson(json['user']),
      );
}
