import 'package:flutter/material.dart';
import 'package:invite_vn/features/splash/on_boarding.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {
  PageController _controller = PageController(keepPage: false);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _controller.addListener(
      () {
        if (_controller.page == 0.0) {
          setState(() {
            _firstIndicator = AppColors.TORTOISE;
            _secondIndicator = Colors.transparent;
          });
        }

        if (_controller.page == 1.0) {
          setState(() {
            _firstIndicator = Colors.transparent;
            _secondIndicator = AppColors.TORTOISE;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _firstIndicator = AppColors.TORTOISE;
  Color _secondIndicator = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            itemCount: 2,
            itemBuilder: (context, index) {
              List<OnBoardingModel> listData = List();
              listData.add(
                OnBoardingModel(
                  image: Assets.onBoarding01,
                  title: 'Bạn không biết...',
                  content: 'Tìm chỗ để chơi? Tìm người để hẹn?',
                  button: 'Tiếp tục',
                ),
              );
              listData.add(
                OnBoardingModel(
                  image: Assets.onBoarding02,
                  title: '... bật ngay Teviin',
                  content: 'Khám phá địa điểm! Kết thêm bạn mới!',
                  button: 'Bắt đầu',
                ),
              );
              return OnBoarding(
                model: listData[index],
                index: index,
                onTap: () {
                  if (index == 0) {
                    _controller.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }
                },
              );
            },
          ),
          Positioned(
            bottom: 110.0,
            left: (MediaQuery.of(context).size.width / 2) - 17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5.0),
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: _firstIndicator,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: AppColors.TORTOISE, width: 1.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                    color: _secondIndicator,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: AppColors.TORTOISE, width: 1.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
