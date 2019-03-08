import 'dart:async';

import 'package:async/async.dart';
import 'package:invite_vn/data/user/dtos/user_response.dart';
import 'package:invite_vn/data/user/models/user.dart';
import 'package:invite_vn/data/user/repositories/user_repository.dart';
import 'package:invite_vn/data/user/repositories/user_repository_service.dart';
import 'package:invite_vn/features/bloc.dart';
import 'package:invite_vn/modules/facebook/facebook_user.dart';
import 'package:rxdart/subjects.dart';

class UserBloc implements Bloc {
  final UserRepository userRepository;


  UserBloc({this.userRepository});

  CancelableOperation<UserResponse> _cancelableOperation;

  BehaviorSubject<User> _userSubject = BehaviorSubject();

  Stream<User> get user => _userSubject.stream;

  //// Login
  Future<bool> login({String id, String accessToken}) async {
    print("login");
    _cancelableOperation = CancelableOperation.fromFuture(userRepository
        .login(LoginUserRequest(type: 1, id: id, accessToken: accessToken)));

    final response = await _cancelableOperation.value;
    final loginResponse = response as LoginUserResponse;

    _userSubject.sink.add(loginResponse.user);
    return loginResponse.error.isEmpty;
  }

  //// Logout
  Future<bool> logout() async {
    _cancelableOperation = CancelableOperation.fromFuture(
        userRepository.logout(LogoutUserRequest()));

    final response = await _cancelableOperation.value;
    final logoutResponse = response as LogoutUserResponse;

    bool isSuccess = logoutResponse.error.isEmpty;
    if (isSuccess) _userSubject.sink.add(null);
    return isSuccess;
  }

  //// Temp for first edit profile
  void setTempUser({FacebookUser facebookUser}) {
    User user = _userSubject.value;
    user.facebookId = facebookUser.id;
    user.imageUrl = facebookUser.picture;
    user.firstName = facebookUser.firstName;
    user.lastName = facebookUser.lastName;
    user.birthday = facebookUser.birthday;
    user.gender = facebookUser.gender == "male" ? 0 : 1;
    user.accessToken = facebookUser.accessToken;

    _userSubject.add(user);
  }

  void setTempDatetime({String datetime}) {
    User user = _userSubject.value;
    user.birthday = datetime;

    _userSubject.add(user);
  }

  //// Cancel request
  Future<dynamic> cancelRequest() {
    return _cancelableOperation.cancel();
  }

  @override
  dispose() {
    _userSubject.close();
  }
}
