import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';

class OnBoarding extends Container {
  OnBoardingModel model = new OnBoardingModel();
  final GestureTapCallback onTap;
  int index = 0;

  OnBoarding({this.model, this.index, this.onTap});

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
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: index == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: index == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      model.title,
                      style: TextStyle(
                          color: AppColors.TORTOISE,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      model.content,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: index == 0
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      model.image,
                      fit: BoxFit.fill,
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
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
                        decoration: BoxDecoration(
                            color: AppColors.TORTOISE,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text(
                            model.button,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class OnBoardingModel {
  final String image;
  final String title;
  final String content;
  final String button;

  OnBoardingModel({this.image, this.title, this.content, this.button});
}
