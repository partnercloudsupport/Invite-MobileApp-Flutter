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
      body: Column(
        ///NOTE: Must add PageStorageKey
        key: PageStorageKey(Routes.PERSONAL),
        children: <Widget>[
          Text("PersonalScreen"),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Text('entry $index');
              },
            ),
          ),
          RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed(""),
            child: Text("Next Screen"),
          )
        ],
      ),
    );
  }
}
