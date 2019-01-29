import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateProfileScreen();
}

class _StateProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("ProfileScreen"),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(""),
              child: Text("Next Screen"),
            )
          ],
        ),
      ),
    );
  }
}