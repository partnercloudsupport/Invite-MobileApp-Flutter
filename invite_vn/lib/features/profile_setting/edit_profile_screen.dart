import 'package:flutter/material.dart';
import 'package:invite_vn/statics/app_colors.dart';
import 'package:invite_vn/statics/assets.dart';
import 'package:invite_vn/statics/routes.dart';
import 'package:invite_vn/widgets/bar/TopBar.dart';
import 'package:invite_vn/widgets/dialogs/app_dialog.dart';
import 'package:invite_vn/widgets/dialogs/login_success_dialog.dart';
import 'package:invite_vn/widgets/radio_group.dart';
import 'package:invite_vn/widgets/scrollable_content.dart';
import 'package:invite_vn/widgets/textfields/GrayTextField.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateEditProfileScreen();
}

class _StateEditProfileScreen extends State<EditProfileScreen>
    with ScrollableContentHelper {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

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
                routes: Routes.EDIT_PROFILE,
                onRightTap: () {
                  AppDialog.show(
                    context: context,
                    child: LoginSuccessDialog(
                      onTap: () {
                        if (AppDialog.close(context)) {
                          Navigator.of(context).pushNamed(Routes.PROFILE);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      key: contentKey,
      children: <Widget>[
        SizedBox.fromSize(
            size: Size(120.0, 120.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Assets.logo),
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
            )),
        buildForm(
            title: "Họ", hintText: "Nhập họ", controller: firstNameController),
        buildForm(
            title: "Tên", hintText: "Nhập tên", controller: lastNameController),
        buildForm(
            title: "Ngày sinh",
            hintText: "Chọn ngày sinh",
            isBirthday: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime.now(),
              );
            }),
        buildForm(title: "Giới tính", isGender: true),
      ],
    );
  }

  Widget buildForm(
      {String title,
      String hintText,
      TextEditingController controller,
      GestureTapCallback onTap,
      bool isBirthday = false,
      bool isGender = false}) {
    Widget inputField;
    if (isGender) {
      inputField = RadioGroup(
        row: true,
        titles: <String>[
          "Nam",
          "Nữ",
          "Khác",
        ],
        currentTitle: (value) {
          print(value);
        },
      );
    } else {
      inputField = GrayTextField(
        enabled: !isBirthday,
        onTap: onTap,
        controller: controller,
        hintText: hintText,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 10.0),
          child: Text(title),
        ),
        inputField,
      ],
    );
  }
}
