import 'package:flutter/material.dart';
import 'package:invite_vn/widgets/buttons/facebook_button.dart';
import 'package:invite_vn/widgets/buttons/red_white_button.dart';
import 'package:invite_vn/widgets/buttons/right_arrow_button.dart';

class AppButton extends StatelessWidget {
  static const int Facebook = 0;
  static const int RightArrow = 1;
  static const int RedWhite = 2;

  final ValueGetter<void> onTap;
  final String title;
  final int type;

  const AppButton({
    Key key,
    @required this.type,
    this.onTap,
    this.title,
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
    }
    return null;
  }
}
