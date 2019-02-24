import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/strings.dart';

class RequestAcceptedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset(
            Assets.close,
            width: 32.0,
            height: 32.0,
          ),
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        )
      ],
    );
//        Center(
//          child: Container(
//            padding: EdgeInsets.only(top: 30.0),
//            margin: EdgeInsets.only(left: 50.0, right: 50.0),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Image.asset(
//                  Assets.congratulate,
//                  width: 135.0,
//                  height: 128.0,
//                ),
//                Container(
//                  margin: EdgeInsets.all(20.0),
//                  child: Directionality(
//                    textDirection: TextDirection.ltr,
//                    child: Text(
//                      'Chúc mừng'.toUpperCase(),
//                      style: TextStyle(
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.bold,
//                        color: AppColors.TORTOISE,
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.only(right: 16.0, left: 16.0),
//                  child: Directionality(
//                    textDirection: TextDirection.ltr,
//                    child: Text(
//                      'Yêu cầu của bạn đã được chấp nhận. Trò chuyện để giao lưu với những thành viên còn lại nhé',
//                      style: TextStyle(color: Colors.black, fontSize: 18.0,
//                          fontWeight: FontWeight.w300),
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.only(top: 24.0),
//                  width: double.infinity,
//                  color: AppColors.TORTOISE,
//                  padding: EdgeInsets.all(15.0),
//                  child: Directionality(
//                    textDirection: TextDirection.ltr,
//                    child: Text(
//                      'Trò chuyện'.toUpperCase(),
//                      style: TextStyle(
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white,
//                      ),
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                )
//              ],
//            ),
//            decoration: BoxDecoration(color: Colors.white),
//          ),
//        ),
//      ],
//    );
  }
}
