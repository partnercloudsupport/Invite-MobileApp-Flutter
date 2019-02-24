import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/routes.dart';

class AskDialog extends StatelessWidget {
  final ValueGetter<void> onPositiveTap;
  final ValueGetter<void> onNegativeTap;

  const AskDialog({Key key, this.onPositiveTap, this.onNegativeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message;
    String negative;
    String positive;

    switch (ModalRoute.of(context).settings.name) {
      case Routes.SPLASH:
        message = "Bạn có chắc chắn có muốn từ chối tham gia hoạt động này?";
        negative = "KHÔNG";
        positive = "CÓ";
        break;

      case Routes.LOGOUT:
        message = "Bạn muốn đăng xuất khỏi Invite";
        negative = "HỦY";
        positive = "ĐĂNG XUẤT";
        break;
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 20.0, bottom: 30.0, left: 20.0),
          child: Text(message, style: TextStyle(fontSize: 15.0),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildButton(title: negative, onTap: onNegativeTap, isPositive: false),
            buildButton(title: positive, onTap: onPositiveTap),
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
