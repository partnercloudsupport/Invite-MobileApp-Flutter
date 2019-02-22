import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/background/TopGradientBackground.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';
import 'package:invite_vn/widgets/buttons/app_button.dart';
import 'package:invite_vn/widgets/card/AppCard.dart';
import 'package:invite_vn/widgets/dialogs/app_dialog.dart';
import 'package:invite_vn/widgets/dialogs/ask_dialog.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateProfileScreen();
}

class _StateProfileScreen extends State<ProfileScreen> {
  double avatarSize = 120.0;
  double infoCardSize = 160.0;
  double borderSize = 5.0;

  void clickEditProfile() => Navigator.of(context).pushNamed(Routes.EDIT_PROFILE);
  void clickFeedback() => Navigator.of(context).pushNamed(Routes.FEEDBACK);
  void clickInviteUseApp() => Navigator.of(context).pushNamed(Routes.INVITE_USE_APP);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TopGradientBackground(),
          SafeArea(
            child: TopBar(),
          ),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.3 - (160 + 120) / 2,
          left: 20.0,
          right: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              buildInfoCard(),
              buildAvatar(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: buildNavigationInfoCard(),
          ),
          AppButton(
            type: AppButton.RedWhite,
            title: "Đăng xuất",
            onTap: () {
              AppDialog.show(
                context: context,
                child: AskDialog(
                  onPositiveTap: () {
                    AppDialog.close(context);
                  },
                  onNegativeTap: () {
                    AppDialog.close(context);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(avatarSize, avatarSize),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(borderSize),
              child: SizedBox.expand(
                child: CircleAvatar(
                  backgroundImage: AssetImage(Assets.logo),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildInfoCard() {
    return Padding(
      padding: EdgeInsets.only(top: avatarSize / 2),
      child: AppCard(
        height: infoCardSize,
        child: Padding(
          padding: EdgeInsets.only(top: avatarSize / 2 - borderSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Username here",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image.asset(Assets.female),
                  ),
                  Text(
                    "19 tuổi",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavigationInfoCard() {
    return AppCard(
      child: Column(
        children: <Widget>[
          AppButton(
            type: AppButton.RightArrow,
            title: "Thông tin cá nhân",
            onTap: clickEditProfile,
          ),
          buildDivider(),
          AppButton(
            type: AppButton.RightArrow,
            title: "Gửi phản hồi",
            onTap: clickFeedback,
          ),
          buildDivider(),
          AppButton(
            type: AppButton.RightArrow,
            title: "Mời bạn bè dùng Invite",
            onTap: clickInviteUseApp,
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Divider(
        color: AppColors.SCREEN,
        height: 1.0,
      ),
    );
  }
}
