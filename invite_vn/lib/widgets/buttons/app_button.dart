import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';
import 'package:invite_vn/widgets/buttons/facebook_button.dart';
import 'package:invite_vn/widgets/buttons/red_white_button.dart';
import 'package:invite_vn/widgets/buttons/right_arrow_button.dart';

enum ButtonType { GREY, TORTOISE, RED }

class AppButton extends StatelessWidget {
  static const int Facebook = 0;
  static const int RightArrow = 1;
  static const int RedWhite = 2;
  static const int Grey = 3;

  final GestureTapCallback onTap;
  final String title;
  final int type;
  final ButtonType buttonType;
  final Widget child;
  final Size size;
  final ShapeBorder shape;

  const AppButton({
    Key key,
    this.type,
    this.onTap,
    this.title,
    this.buttonType,
    this.child,
    this.size,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case Facebook:
        return FacebookButton(
          onTap: onTap,
          title: "Đăng nhập bằng Facebook".toUpperCase(),
        );

      case RightArrow:
        return RightArrowButton(
          onTap: onTap,
          title: title,
        );

      case RedWhite:
        return RedWhiteButton(
          onTap: onTap,
          title: title,
        );

      case Grey:
        return BaseButton();
    }

    Color color;
    Widget parent;

    switch (buttonType) {
      case ButtonType.GREY:
        color = AppColors.SCREEN;
        parent = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: AppColors.HEADLINE_BODY,
              ),
            ),
            child,
          ],
        );
        break;

      case ButtonType.TORTOISE:
        color = AppColors.TORTOISE;
        parent = Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.WHITE,
              fontWeight: FontWeight.w500,
              fontSize: size != null ? 13.0 : 15.0,
            ),
          ),
        );
        break;


      case ButtonType.RED:
        color = AppColors.RED;
        parent = Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.WHITE,
              fontWeight: FontWeight.w500,
              fontSize: size != null ? 13.0 : 15.0,
            ),
          ),
        );
        break;
    }
    return BaseButton(
      shape: shape,
      size: size ?? Size(double.maxFinite, 48.0),
      color: color,
      onTap: onTap,
      child: parent,
    );
  }
}
