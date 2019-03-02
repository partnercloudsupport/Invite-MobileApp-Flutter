import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';

class OnBoarding extends Container {
  OnBoardingModel model = new OnBoardingModel();
  final GestureTapCallback onTap;

  OnBoarding({this.model, this.onTap});

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
              model.title,
              style: TextStyle(
                  color: AppColors.TORTOISE,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.0),
            child: Text(
              model.content,
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
                      child: GestureDetector(
                        onTap: onTap,
                        child: Container(
                          margin: EdgeInsets.only(left: 47.0, right: 47.0),
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(color: AppColors.TORTOISE,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Text(
                              model.button,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                              ),
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

class OnBoardingModel{
  final String image;
  final String title;
  final String content;
  final String button;

  OnBoardingModel({this.image, this.title, this.content, this.button});
}
