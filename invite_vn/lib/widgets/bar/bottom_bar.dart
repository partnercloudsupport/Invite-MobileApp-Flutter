import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/buttons/tortoise_button.dart';
import 'package:invite_vn/widgets/buttons/white_red_button.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateBottomBar();
}

class _StateBottomBar extends State<BottomBar> {
  int _state = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: new Offset(0.0, -1.5),
            blurRadius: 2.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          top: 12.0,
          right: 20.0,
          bottom: 12.0,
        ),
        child: _child(),
      ),
    );
  }

  Widget _child() {
    switch (_state) {
      case 0:
        return TortoiseButton(
          onTap: () {},
          title: "THAM GIA CÙNG",
        );

      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Đã gửi lời mời",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.HEADLINE_BODY),
                ),
                Text(
                  "Đang chờ phản hồi",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.FOOTNOTE_CAPTION,
                  ),
                )
              ],
            ),
            WhiteRedButton(
              title: "HỦY",
              onTap: () {},
              size: Size(80.0, 48.0),
            )
          ],
        );

      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Người tạo đã đồng ý",
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF2D9CDB),
              ),
            ),
            TortoiseButton(
              title: "TRÒ CHUYỆN",
              onTap: _navigateToChatScreen,
              size: Size(120.0, 48.0),
            ),
          ],
        );

      case 3:
        return TortoiseButton(
          onTap: _navigateToChatScreen,
          title: "TRÒ CHUYỆN",
        );

      default:
        return null;
    }
  }

  _navigateToChatScreen() => Navigator.of(context).pushNamed(Routes.CHAT);
}
