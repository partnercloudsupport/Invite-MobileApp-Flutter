import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatePersonalScreen();
}

class _StatePersonalScreen extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        key: PageStorageKey(Routes.PERSONAL),
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: 48.0,
              width: 133.0,
              child: Center(
                child: Text(
                  'Tạo mới',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.green,
                      Colors.greenAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24.0)),
            ),
          )
        ],
      ),
    );
  }
}
