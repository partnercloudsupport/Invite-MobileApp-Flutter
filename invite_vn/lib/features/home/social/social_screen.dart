import 'package:flutter/material.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateSocialScreen();
}

class _StateSocialScreen extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("SocialScreen"),
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