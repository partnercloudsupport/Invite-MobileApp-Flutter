import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/strings.dart';

class RequestAcceptedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 50.0, right: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(Assets.close),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Image.asset(
                Assets.congratulate,
                width: 135.0,
                height: 128.0,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  S.of(context).congratulate.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.TORTOISE,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16.0, left: 16.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  S.of(context).request_accepted,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0),
              width: double.infinity,
              color: AppColors.TORTOISE,
              padding: EdgeInsets.all(15.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  S.of(context).chat.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
