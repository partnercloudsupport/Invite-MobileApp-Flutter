import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("SplashScreen"),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.LOGIN),
              child: Text("Next Screen"),
            )
          ],
        ),
      ),
    );
  }
}
