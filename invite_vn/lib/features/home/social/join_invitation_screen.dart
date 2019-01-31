import 'package:flutter/material.dart';

class JoinInvitationScreen extends StatefulWidget {
  JoinInvitationScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateJoinInvitationScreen();
}

class _StateJoinInvitationScreen extends State<JoinInvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("JoinInvitationScreen"),
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