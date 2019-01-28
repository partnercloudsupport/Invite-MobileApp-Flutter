import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  WaitingScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateWaitingScreen();
}

class _StateWaitingScreen extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("WaitingScreen"),
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