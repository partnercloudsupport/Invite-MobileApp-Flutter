import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuth {
  final _facebookLogin = FacebookLogin();

  void login({
    ValueChanged<String> loggedIn,
    ValueGetter<void> cancelledByUser,
    ValueChanged<String> error,
  }) async {
    final result = await _facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        loggedIn("success");
//        _sendTokenToServer(result.accessToken.token);
//        _showLoggedInUI();
        break;
      case FacebookLoginStatus.cancelledByUser:
        cancelledByUser();
//        _showCancelledMessage();
        break;
      case FacebookLoginStatus.error:
        error(result.errorMessage);
//        _showErrorOnUI(result.errorMessage);
        break;
    }
  }
}
