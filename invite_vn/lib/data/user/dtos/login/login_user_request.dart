import 'package:invite_vn/data/user/dtos/user_request.dart';

class LoginUserRequest extends UserRequest {
  final int type;
  final String id;
  final String accessToken;

  LoginUserRequest({this.type, this.id, this.accessToken});

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'access_token': accessToken,
      };
}
