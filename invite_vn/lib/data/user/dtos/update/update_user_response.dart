import 'package:invite_vn/data/user/dtos/user_response.dart';

class UpdateUserResponse extends UserResponse {
  UpdateUserResponse({String error}) : super(error: error);

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse(error: json['error']);
}
