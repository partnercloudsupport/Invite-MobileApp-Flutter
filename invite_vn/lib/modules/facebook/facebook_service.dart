import 'dart:async';
import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart';
import 'package:invite_vn/modules/facebook/facebook_user.dart';

class FacebookService {
  static const String URL_INFO =
      "https://graph.facebook.com/v3.2/me?fields=picture.width(180).height(180)%2Cfirst_name%2Clast_name%2Cbirthday%2Cgender&access_token=";

  FacebookLoginResult _result;

  final _facebookLogin = FacebookLogin();

  Future<bool> isLoggedIn() {
    return _facebookLogin.isLoggedIn;
  }

  void login({
    void Function(String id, String token) loggedIn,
    void Function() cancelledByUser,
    void Function(String value) error,
  }) async {
    final result = await _facebookLogin.logInWithReadPermissions(
        ['public_profile', 'user_birthday', 'user_gender']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        _result = result;
        loggedIn(result.accessToken.userId, result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        cancelledByUser();
        break;
      case FacebookLoginStatus.error:
        error(result.errorMessage);
        break;
    }
  }

  Future<FacebookUser> getUserInfo() async {
    Response response = await get("$URL_INFO${_result.accessToken.token}");
    print("Facebook response: ${response.body}");
//    print(object)
    return FacebookUser.fromJson(json.decode(response.body));
  }
}

//// Test
void main() {
  final service = FacebookService();
  service.getUserInfo().then((user) {
    print(user.firstName);
  });
}
