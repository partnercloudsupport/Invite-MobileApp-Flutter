import 'package:flutter/widgets.dart'
    show GestureTapCallback, TextStyle, FontWeight, Text, Size, Center;
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class TortoiseButton extends BaseButton {
  TortoiseButton({GestureTapCallback onTap, String title, Size size})
      : super(
          onTap: onTap,
          color: AppColors.TORTOISE,
          size: size ?? Size(double.maxFinite, 48.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.WHITE,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
          ),
        );
}
