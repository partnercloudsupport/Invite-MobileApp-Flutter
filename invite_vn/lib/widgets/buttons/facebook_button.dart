import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class FacebookButton extends BaseButton {
  FacebookButton({Key key, GestureTapCallback onTap, String title})
      : super(
          key: key,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          color: Color(0xFF2A6CB9),
          onTap: onTap,
          size: Size(double.maxFinite, 56.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: AppColors.WHITE,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        );
}
