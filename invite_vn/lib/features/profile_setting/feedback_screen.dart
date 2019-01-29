import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFeedbackScreen();
}

class _StateFeedbackScreen extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("FeedbackScreen"),
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