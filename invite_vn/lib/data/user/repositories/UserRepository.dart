import 'package:invite_vn/data/repository.dart';
import 'package:invite_vn/data/user/models/UserRequest.dart';
import 'package:invite_vn/data/user/models/UserResponse.dart';

abstract class UserRepository extends Repository<UserRequest, UserResponse> {}
