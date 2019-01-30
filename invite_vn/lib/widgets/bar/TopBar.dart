import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';

class TopBar extends StatelessWidget {
  final String routes;
  final GestureTapCallback onLeftTap;
  final GestureTapCallback onRightTap;

  const TopBar({
    Key key,
    @required this.routes,
    this.onLeftTap,
    this.onRightTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget left;
    Widget right;
    Widget middle;
    final children = <Widget>[];

    switch (routes) {
      case Routes.EDIT_PROFILE:
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        right = buildText(title: "LƯU", color: color);
        break;

      case Routes.INVITE_USE_APP:
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        middle = buildText(title: "Mời bạn bè dùng Invite");
        break;

      case Routes.SEND_FEEDBACK:
        Color color = AppColors.TORTOISE;
        left = buildIcon(Assets.back, color);
        middle = buildText(title: "Gửi phản hồi");
        break;
    }

    if (middle != null) {
      children.add(
        Center(
          child: Positioned(child: middle),
        ),
      );
    }

    if (left != null) {
      children.add(
        Align(
          alignment: Alignment.centerLeft,
          child: buildTap(left, onLeftTap),
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

    return Padding(
      padding: EdgeInsets.only(
        left: 20.0, right: 20.0, top: 24.0,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: children,
            fit: StackFit.loose,
          )
        ],
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
