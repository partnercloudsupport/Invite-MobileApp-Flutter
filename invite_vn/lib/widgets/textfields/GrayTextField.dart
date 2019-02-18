import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';

class GrayTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final GestureTapCallback onTap;
  final String hintText;

  const GrayTextField({Key key, this.controller, this.enabled, this.onTap, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          color: AppColors.BACKGROUND,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Center(
          child: TextField(
            enabled: enabled,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
