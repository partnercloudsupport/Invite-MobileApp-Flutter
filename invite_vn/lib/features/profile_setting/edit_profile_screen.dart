import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invite_vn/data/user/models/user.dart';
import 'package:invite_vn/features/profile_setting/user_bloc.dart';
import 'package:invite_vn/modules/facebook/facebook_service.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';
import 'package:invite_vn/widgets/dialogs/app_dialog.dart';
import 'package:invite_vn/widgets/dialogs/logo_dialog.dart';
import 'package:invite_vn/widgets/radio_group.dart';
import 'package:invite_vn/widgets/scrollable_content.dart';
import 'package:invite_vn/widgets/textfields/GrayTextField.dart';

class EditProfileScreen extends StatefulWidget {
  final bool isFirstTime;
  final FacebookService facebookService;
  final UserBloc userBloc;

  EditProfileScreen(
      {Key key, this.isFirstTime, this.facebookService, this.userBloc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateEditProfileScreen();
}

class _StateEditProfileScreen extends State<EditProfileScreen>
    with ScrollableContentHelper {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  bool _isFirstTime;
  FacebookService _facebookService;
  UserBloc _userBloc;

  //////// Init
  @override
  void initState() {
    super.initState();
    _isFirstTime = widget.isFirstTime;
    _userBloc = widget.userBloc;
    if (_isFirstTime) {
      _facebookService = widget.facebookService;
      _facebookService.getUserInfo().then((facebookUser) {
        _userBloc.setTempUser(facebookUser: facebookUser);
      }).catchError((error) {
        print("Facebook Error: $error");
      });
    }
  }

  //////// Click
  void _updateInfo() {
    _userBloc.update()
        .then((success) {
        if (success) {
          AppDialog.show(
            context: context,
            child: LogoDialog(
              onTap: () {
                if (AppDialog.close(context)) {
                  _navigateToNextScreen();
                }
              },
            ),
          );
        } else {

        }
    });

  }

  void _clickDatePicker({String birthday}) {
    final values = birthday.split("/");
    DateTime initialDate;
    if (values.length == 3) {
      initialDate = DateTime(
          int.parse(values[2]), int.parse(values[1]), int.parse(values[0]));
    } else {
      initialDate = DateTime(2000);
    }

    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.utc(1970),
      lastDate: DateTime.now(),
    ).then((datetime) {
      birthdayController.text = DateFormat.yMd().format(datetime);
//      _userBloc.setTempDatetime(
//        datetime: DateFormat.yMd().format(datetime),
//      );
    });
  }

  //// Navigate
  _navigateToNextScreen() {
    Navigator.of(context).pushNamed(Routes.PROFILE);
  }

  //////// Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          key: bodyKey,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: ScrollableContent(
                  factor: 0.35,
                  bodyKey: bodyKey,
                  contentKey: contentKey,
                  child: buildContent(),
                ),
              ),
              TopBar(
                onRightTap: _updateInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return StreamBuilder(
      key: contentKey,
      stream: _userBloc.user,
      builder: (BuildContext context, AsyncSnapshot<User> asyncSnapshot) {
        try {
          User user = asyncSnapshot.data ?? User();
          return Column(
            children: <Widget>[
              buildAvatar(imageUrl: user.imageUrl),
              buildForm(
                  title: "Họ",
                  hintText: "Nhập họ",
                  text: user.firstName,
                  controller: firstNameController),
              buildForm(
                  title: "Tên",
                  hintText: "Nhập tên",
                  text: user.lastName,
                  controller: lastNameController),
              buildForm(
                  title: "Ngày sinh",
                  hintText: "Chọn ngày sinh",
                  text: user.birthday ?? "",
                  controller: birthdayController,
                  isBirthday: true,
                  onTap: () => _clickDatePicker(birthday: user.birthday ?? "")),
              buildRadioForm(title: "Giới tính", initValue: user.gender),
            ],
          );
        } finally {
          Future.delayed(
              Duration(
                milliseconds: 16,
              ), () {
            ScrollableContent.of(context).executeCalculateCenter();
          });
        }
      },
    );
  }

  Widget buildForm({
    String title,
    String hintText,
    String text,
    TextEditingController controller,
    GestureTapCallback onTap,
    bool isBirthday = false,
  }) {
    controller.text = text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
          child: Text(title),
        ),
        GrayTextField(
          enabled: !isBirthday,
          onTap: onTap,
          controller: controller,
          hintText: hintText,
        ),
      ],
    );
  }

  Widget buildRadioForm({String title, int initValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
          child: Text(title),
        ),
        RadioGroup(
          row: true,
          values: {
            0: "Nam",
            1: "Nữ",
            2: "Khác",
          },
          initValue: initValue,
          currentValue: (value) {
            print(value);
          },
        ),
      ],
    );
  }

  Widget buildAvatar({String imageUrl}) {
    return SizedBox.fromSize(
      size: Size(120.0, 120.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            child: imageUrl.isEmpty
                ? SizedBox.expand(
                    child: Image.asset(Assets.logo),
                  )
                : CachedNetworkImage(
                    fadeInDuration: Duration(),
                    fadeOutDuration: Duration(),
                    width: 120.0,
                    height: 120.0,
                    imageUrl: imageUrl,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) {
                      return Image.asset(Assets.logo);
                    },
                  ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox.fromSize(
              size: Size(32.0, 32.0),
              child: Image.asset(Assets.pencil),
            ),
          ),
        ],
      ),
    );
  }
}
