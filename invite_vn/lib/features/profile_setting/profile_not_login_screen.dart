import 'package:flutter/material.dart';
import 'package:invite_vn/features/profile_setting/user_bloc.dart';
import 'package:invite_vn/modules/facebook/facebook_service.dart';
import 'package:invite_vn/modules/firebase/firebase_mess.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';
import 'package:invite_vn/widgets/buttons/app_button.dart';

class ProfileNotLoginScreen extends StatefulWidget {
  final UserBloc userBloc;
  final FacebookService facebookService;
  final FirebaseMess firebaseMess;

  ProfileNotLoginScreen({Key key,@required this.facebookService,@required this.firebaseMess, this.userBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateProfileNotLoginScreen();
}

class _StateProfileNotLoginScreen extends State<ProfileNotLoginScreen> {

  FacebookService _facebookService;
  FirebaseMess _firebaseMess;
  UserBloc _userBloc;

  //////// Init
  @override
  void initState() {
    super.initState();
    _userBloc = widget.userBloc;
    _facebookService = widget.facebookService;

    _firebaseMess = widget.firebaseMess;
    _firebaseMess.config();
  }

  //////// Click
  void _clickSignInWithFacebook() {
    _facebookService.login(loggedIn: (String id, String token) {
      print("Token: $token");
      _userBloc.login(id: id, accessToken: token).then((success) {
        print(success);
        if (success) {
          _navigateToNextScreen();
        } else {

        }
      }).catchError((error) {
        print(error);
      });
    }, cancelledByUser: () {

    }, error: (error) {
      print(error);
    });
  }

  //////// Navigate
  void _navigateToNextScreen() {
    Navigator.pushReplacementNamed(context, Routes.EDIT_PROFILE_FIRST_TIME, );
  }

  //////// Build
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

        SafeArea(
          child: TopBar(),
        )
      ],
    );
  }

  Widget buildContent() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 48.0, right: 48.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size(160.0, 160.0),
              child: Image.asset(Assets.logo),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 86.0),
              child: Text(
                "Bạn cần đăng nhập để tham gia các hoạt động thú vị cùng Invite",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.WHITE,
                ),
              ),
            ),
            AppButton(
              type: AppButton.Facebook,
              onTap: _clickSignInWithFacebook,
            ),
          ],
        ),
      ),
    );
  }
}
