import 'package:flutter/material.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatePersonalScreen();
}

class _StatePersonalScreen extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("PersonalScreen"),
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