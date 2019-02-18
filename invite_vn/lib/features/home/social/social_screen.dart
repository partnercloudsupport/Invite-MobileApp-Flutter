import 'package:flutter/material.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/item_communicate.dart';
import 'package:invite_vn/data/activity/activity.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateSocialScreen();
}

class _StateSocialScreen extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        ///NOTE: Must add PageStorageKey
        key: PageStorageKey(Routes.SOCIAL),
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return ItemCommunicate(ActivityModel()).build(context); // getItem
              },
              itemExtent: 200,
            ),
          ),
//          RaisedButton(
//            onPressed: () =>
//                Navigator.of(context).pushNamed(Routes.JOIN_INVITATION),
//            child: Text("Next Screen"),
//          )
        ],
      ),
    );
  }
}
