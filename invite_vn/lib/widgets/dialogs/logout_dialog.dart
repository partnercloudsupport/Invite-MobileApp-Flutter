import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';

class LogoutDialog extends StatelessWidget {
  final ValueGetter<void> onPositiveTap;
  final ValueGetter<void> onNegativeTap;

  const LogoutDialog({Key key, this.onPositiveTap, this.onNegativeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 20.0, bottom: 30.0, left: 20.0),
          child: Text("Bạn muốn đăng xuất khỏi Invite", style: TextStyle(fontSize: 15.0),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildButton(title: "HỦY", onTap: onNegativeTap, isPositive: false),
            buildButton(title: "ĐĂNG XUẤT", onTap: onPositiveTap),
          ],
        )
      ],
    );
  }

  Widget buildButton(
      {String title, GestureTapCallback onTap, bool isPositive = true}) {
    return FlatButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: isPositive ? AppColors.RED : AppColors.TORTOISE,
          fontSize: 14.0
        ),
      ),
    );
  }
}
