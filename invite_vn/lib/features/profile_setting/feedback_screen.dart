import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFeedbackScreen();
}

class _StateFeedbackScreen extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TopBar(
              routes: Routes.FEEDBACK,
            )
          ],
        ),
      ),
    );
  }
}
