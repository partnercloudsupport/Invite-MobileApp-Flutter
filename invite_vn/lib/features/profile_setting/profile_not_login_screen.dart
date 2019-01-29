import 'package:flutter/material.dart';

class ProfileNotLoginScreen extends StatefulWidget {
  ProfileNotLoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateProfileNotLoginScreen();
}

class _StateProfileNotLoginScreen extends State<ProfileNotLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("ProfileNotLoginScreen"),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed(""),
                child: Text("Next Screen"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      children: <Widget>[
        Image(image: AssetImage('ass/background.png'))
      ],
    );
  }
}
