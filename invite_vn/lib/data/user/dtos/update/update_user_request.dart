import 'package:invite_vn/data/user/dtos/user_request.dart';
import 'package:invite_vn/data/user/models/user.dart';

class UpdateUserRequest extends UserRequest {
  User user;

  UpdateUserRequest({this.user});

  Map<String, dynamic> toJson() {
    return {"user": user.toJson()};
  }
}
