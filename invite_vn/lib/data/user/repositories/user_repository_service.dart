import 'dart:convert';

import 'package:http/http.dart';
import 'package:invite_vn/data/user/dtos/update/update_user_request.dart';
import 'package:invite_vn/data/user/dtos/user_request.dart';
import 'package:invite_vn/data/user/dtos/user_response.dart';
import 'package:invite_vn/data/user/repositories/user_api_service.dart';
import 'package:invite_vn/data/user/repositories/user_repository.dart';

class UserRepositoryService extends UserRepository {
  final UserApiService userApiService;

  UserRepositoryService({this.userApiService});

  @override
  Future<UserResponse> login(UserRequest request) async {
    final loginRequest = request as LoginUserRequest;
    Response response =
    await userApiService.login(body: json.encode(loginRequest.toJson()));
    return LoginUserResponse.fromJson(json.decode(response.body));
  }

  @override
  Future<UserResponse> logout(UserRequest request) async {
    final logoutRequest = request as LogoutUserRequest;
    Response response = await userApiService.logout(
      body: json.encode(logoutRequest.toJson()),
      headers: getHeaders(),
    );
    return LogoutUserResponse.fromJson(json.decode(response.body));
  }

  @override
  Future<UserResponse> delete(UserRequest request) {
    return null;
  }

  @override
  Future<UserResponse> get(UserRequest request) {
    return null;
  }

  @override
  Future<UserResponse> insert(UserRequest request) {
    return null;
  }

  @override
  Future<UserResponse> update(UserRequest request) {
    final update = request as UpdateUserRequest;
    return null;
  }
}

void main() {
  UserRepositoryService service =
      UserRepositoryService(userApiService: UserApiService());
//  service
//      .login(LoginUserRequest(
//    type: 1,
//    id: "117034386097973",
//    accessToken:
//        "EAAOZBaJjqIZCoBAGJJLpt8q1TVq03Y5wIl6yqgpHq32iSguIKDHRfOjYt4ORVy7KsaWWLj9LycRepZBN56KZBtsq55HDITLdEh0Cw7xKUep18jpJ2HMHmYyZBzcwQnQb1O1cJEHpZAzLAFBRjekzZBiibgRgxOhvehsGaj52LbHsd9DrZC3caeJzjpCuQjNZBGNGgZBlMnZCRjoptIeNWJowX0p",
//  ))
//      .then(
//    (response) {
//      final loginResponse = response as LoginUserResponse;
//      print(loginResponse.user.facebookId);
//      print(loginResponse);
//    },
//  );

  service.logout(LogoutUserRequest()).then((response) {
    final logoutResponse = response as LogoutUserResponse;
    print(logoutResponse.error.isEmpty);
  });
}
