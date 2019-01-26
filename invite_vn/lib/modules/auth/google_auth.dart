import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void init() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
//      setState(() {
//        _currentUser = account;
//      });
//      if (_currentUser != null) {
//        _handleGetContact();
//      }
    });
    _googleSignIn.signInSilently();
  }

  void login() async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
  }
}
