import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';

class OnBoarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 92.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Assets.congratulate,
            width: 280.0,
            height: 280.0,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.only(top: 53.0),
            child: Text(
              'OnBoarding 1',
              style: TextStyle(
                  color: AppColors.TORTOISE,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.0),
            child: Text(
              'Xin chào Teviin',
              style: TextStyle(
                  color: AppColors.SECONDARY,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(color: AppColors.TORTOISE,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text(
                            'Tiếp tục',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
