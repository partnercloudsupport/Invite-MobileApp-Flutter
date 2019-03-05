import 'package:invite_vn/data/repository.dart';
import 'package:invite_vn/data/user/dtos/user_request.dart';
import 'package:invite_vn/data/user/dtos/user_response.dart';

export 'package:invite_vn/data/user/dtos/login/login_user_request.dart';
export 'package:invite_vn/data/user/dtos/login/login_user_response.dart';
export 'package:invite_vn/data/user/dtos/logout/logout_user_request.dart';
export 'package:invite_vn/data/user/dtos/logout/logout_user_response.dart';

abstract class UserRepository extends Repository<UserRequest, UserResponse> {
  Future<UserResponse> login(UserRequest request);

  Future<UserResponse> logout(UserRequest request);
}
