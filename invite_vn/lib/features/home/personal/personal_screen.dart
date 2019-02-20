import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatePersonalScreen();
}

class _StatePersonalScreen extends State<PersonalScreen> {

  Widget bottomButton(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 48.0,
              width: 133.0,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/icons/ic_add.png"),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Tạo mới',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    getShadow(),
                  ],
                  gradient: getGradient(),
                  borderRadius: BorderRadius.circular(24.0)),
            ),
          ],
        ),
      ],
    );
  }

  BoxShadow getShadow(){
    return BoxShadow(
        color: Colors.black45,
        blurRadius: 40.0,
        offset: Offset(0.0, 5.0)
    );
  }

  Gradient getGradient(){
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      // Add one stop for each color. Stops should increase from 0 to 1
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Colors.green,
        Colors.greenAccent,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        key: PageStorageKey(Routes.PERSONAL),
        children: <Widget>[
          bottomButton(),
        ],
      ),
    );
  }
}
