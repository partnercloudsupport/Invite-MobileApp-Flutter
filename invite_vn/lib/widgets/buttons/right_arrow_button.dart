import 'package:flutter/material.dart';
import 'package:invite_vn/widgets/buttons/base_button.dart';

class RightArrowButton extends BaseButton {
  RightArrowButton({Key key, ValueGetter<void> onTap, String title})
      : super(
          onTap: onTap,
          color: Colors.transparent,
          size: Size(double.maxFinite, 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        );
}
