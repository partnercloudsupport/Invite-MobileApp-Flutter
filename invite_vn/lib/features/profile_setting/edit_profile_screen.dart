import 'package:flutter/material.dart';
import 'package:invite_vn/widgets/background/TopGradientBackground.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateEditProfileScreen();
}

class _StateEditProfileScreen extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TopGradientBackground(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return null;
  }
}
