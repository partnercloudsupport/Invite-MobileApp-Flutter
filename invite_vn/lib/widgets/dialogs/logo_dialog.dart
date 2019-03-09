import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class LogoDialog extends StatelessWidget {
  final ValueGetter<void> onTap;

  const LogoDialog({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    String message;
    String titleBtn;
    String logo;
    print("Logo Build: ");
    print(ModalRoute.of(context).settings.name);
    switch (ModalRoute.of(context).settings.name) {
      case Routes.EDIT_PROFILE_FIRST_TIME:
        title = "TUYỆT VỜI";
        message = "Giờ bạn đã có thể tạo và tiếp tục tham gia các hoạt động cùng Invite";
        titleBtn = "OK";
        logo = Assets.acceptLogo;
        break;

      case Routes.EDIT_PROFILE:
        title = "CHÚC MỪNG";
        message = "Yêu cầu của bạn đã được chấp nhận. Trò chuyện để giao lưu với những thành viên còn lại nhé";
        titleBtn = "TRÒ CHUYỆN";
        logo = Assets.successLogo;
        break;

      default:
        title = "TUYỆT VỜI";
        message = "Giờ bạn đã có thể tạo và tiếp tục tham gia các hoạt động cùng Invite";
        titleBtn = "OK";
        logo = Assets.acceptLogo;
        break;
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 32.0),
          child: Image.asset(logo),
        ),
        Text(
          title.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: AppColors.TORTOISE),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, bottom: 32.0, left: 15.0, right: 15.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: AppColors.FOOTNOTE_CAPTION,
            ),
          ),
        ),
        BaseButton(
          size: Size(double.maxFinite, 48.0),
          child: Center(
            child: Text(
              titleBtn,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: AppColors.WHITE),
            ),
          ),
          shape: RoundedRectangleBorder(),
          color: AppColors.TORTOISE,
          onTap: onTap,
        )
      ],
    );
  }
}
