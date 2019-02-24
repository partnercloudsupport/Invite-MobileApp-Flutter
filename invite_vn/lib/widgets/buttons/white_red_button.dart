import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class WhiteRedButton extends BaseButton {
  WhiteRedButton({GestureTapCallback onTap, String title, Size size})
      : super(
    onTap: onTap,
    color: AppColors.RED,
    size: size ?? Size(double.maxFinite, 48.0),
    child: Center(child: Text(
      title,
      style: TextStyle(
        color: AppColors.WHITE,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      ),
    ),),
  );
}