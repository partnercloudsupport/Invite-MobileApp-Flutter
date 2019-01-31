import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateLoginScreen();
}

class _StateLoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("LoginScreen"),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.HOME),
              child: Text("Next Screen"),
            )
          ],
        ),
      ),
    );
  }
}
