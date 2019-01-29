import 'package:flutter/material.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/buttons/app_button.dart';

class ProfileNotLoginScreen extends StatefulWidget {
  ProfileNotLoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateProfileNotLoginScreen();
}

class _StateProfileNotLoginScreen extends State<ProfileNotLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildStack(),
    );
  }

  Widget buildStack() {
    return Stack(
      children: <Widget>[
        ////// BACKGROUND //////
        SizedBox.expand(
          child: Image.asset(
            Assets.profileNotLogin,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.6],
              colors: [Colors.black, Colors.transparent],
            ),
          ),
        ),

        ////// CONTENT //////
        buildContent(),
      ],
    );
  }

  Widget buildContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size(160.0, 160.0),
            child: Image.asset(Assets.logo),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
            child: Text(
              "Bạn cần đăng nhập để tham gia các hoạt động thú vị cùng Invite",
            ),
          ),
          AppButton(
            type: AppButton.Facebook,
            onTap: () {
              Navigator.pushNamed(context, Routes.PROFILE_SETTING);
            },
          ),
        ],
      ),
    );
  }
}
