import 'dart:async';

import 'package:async/async.dart';
import 'package:intl/intl.dart';
import 'package:invite_vn/data/user/dtos/user_response.dart';
import 'package:invite_vn/data/user/models/user.dart';
import 'package:invite_vn/data/user/repositories/user_repository.dart';
import 'package:invite_vn/features/bloc.dart';
import 'package:invite_vn/modules/facebook/facebook_user.dart';
import 'package:rxdart/subjects.dart';

class UserBloc implements Bloc {
  final UserRepository userRepository;

  UserBloc({this.userRepository});

  CancelableOperation<UserResponse> _cancelableOperation;

  BehaviorSubject<User> _userSubject = BehaviorSubject();
  PublishSubject<String> _errorSubject = PublishSubject();

  Stream<User> get user => _userSubject.stream;

  //// Login
  Future<bool> login({String id, String accessToken}) async {
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

  //// Update
  Future<bool> update({String firstName, String lastName, String birthday, int gender}) async {
    print("update");
    final cloneJson = _userSubject.value.toJson();
    final updateUser = User.fromJson(cloneJson);
    updateUser.firstName = firstName;
    updateUser.lastName = lastName;
    final values = birthday.split("/");
    print(values);
    updateUser.birthday = DateTime.utc(int.parse(values[2]), int.parse(values[1]), int.parse(values[0])).toIso8601String();
    updateUser.gender = gender;

    _cancelableOperation = CancelableOperation.fromFuture(
        userRepository.update(UpdateUserRequest(user: updateUser)));

    final response = await _cancelableOperation.value;
    final updateResponse = response as UpdateUserResponse;

    if (updateResponse.error.isEmpty) {
      final datetime = DateTime.parse(updateUser.birthday);
      updateUser.birthday = DateFormat.yMd().format(datetime);
      _userSubject.add(updateUser);
    }

    return updateResponse.error.isEmpty;
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

  //// Cancel request
  Future<dynamic> cancelRequest() {
    return _cancelableOperation.cancel();
  }

  @override
  dispose() {
    _userSubject.close();
    _errorSubject.close();
  }
}
