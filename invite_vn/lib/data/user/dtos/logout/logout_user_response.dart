import 'package:invite_vn/data/user/dtos/user_response.dart';

class LogoutUserResponse extends UserResponse {
  LogoutUserResponse({String error}) : super(error: error);

  factory LogoutUserResponse.fromJson(Map<String, dynamic> json) =>
      LogoutUserResponse(error: json['error']);
}
