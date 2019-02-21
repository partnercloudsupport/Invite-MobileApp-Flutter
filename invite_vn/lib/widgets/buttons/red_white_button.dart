import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class RedWhiteButton extends BaseButton {
  RedWhiteButton({GestureTapCallback onTap, String title, Size size})
      : super(
          onTap: onTap,
          color: AppColors.WHITE,
          size: size ?? Size(double.maxFinite, 48.0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: AppColors.RED,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
        );
}
