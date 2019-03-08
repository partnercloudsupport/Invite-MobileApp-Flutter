import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';

class TopBar extends StatelessWidget {
  final GestureTapCallback onLeftTap;
  final GestureTapCallback onRightTap;

  const TopBar({
    Key key,
    this.onLeftTap,
    this.onRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget left;
    Widget right;
    Widget middle;
    final children = <Widget>[];
    bool hasShadow = false;
    Color headerColor = Colors.transparent;
    bool hasBack = true;

    switch (ModalRoute.of(context).settings.name) {
      case Routes.PROFILE_NOT_LOGIN:
      case Routes.SPLASH:
        Color color = AppColors.TORTOISE;
        left = SizedBox.fromSize(
          size: Size(40.0, 40.0),
          child: CircleAvatar(
            child: buildIcon(Assets.back, color),
            backgroundColor: AppColors.WHITE,
          ),
        );
        break;

      case Routes.PROFILE:
        Color color = AppColors.WHITE;
        left = buildIcon(Assets.back, color);
        break;

      case Routes.EDIT_PROFILE:
      case Routes.EDIT_PROFILE_FIRST_TIME:
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        right = buildText(title: "LƯU", color: color);
        break;

      case Routes.INVITE_USE_APP:
        hasShadow = true;
        headerColor = AppColors.WHITE;
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        middle = buildText(title: "Mời bạn bè dùng Invite");
        break;

      case Routes.FEEDBACK:
        hasShadow = true;
        headerColor = AppColors.WHITE;
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        middle = buildText(title: "Gửi phản hồi");
        break;

      case Routes.CHAT:
        hasShadow = true;
        headerColor = AppColors.WHITE;
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        middle = buildText(title: "Chat screen");
        break;
    }

    if (middle != null) {
      children.add(
        Center(
          child: middle,
        ),
      );
    }

    if (left != null) {
      children.add(
        Align(
          alignment: Alignment.centerLeft,
          child: buildTap(
            left,
            hasBack ? () => Navigator.of(context).pop() : onLeftTap,
          ),
        ),
      );
    }

    if (right != null) {
      children.add(
        Align(
          alignment: Alignment.centerRight,
          child: buildTap(right, onRightTap),
        ),
      );
    }

    return Material(
      elevation: hasShadow ? 5.0 : 0.0,
      shadowColor: Colors.black38,
      color: headerColor,
      child: Container(
        height: 56.0,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Stack(
            children: children,
            fit: StackFit.loose,
          ),
        ),
      ),
    );
  }

  Widget buildText({String title, Color color}) {
    return Text(
      title,
      style:
          TextStyle(fontSize: 18.0, color: color, fontWeight: FontWeight.w500),
    );
  }

  Widget buildIcon(String icon, Color color) {
    return SizedBox(
      width: 24.0,
      height: 24.0,
      child: Image.asset(
        icon,
        color: color,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildTap(Widget widget, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: widget,
      splashColor: Colors.black12,
    );
  }
}
