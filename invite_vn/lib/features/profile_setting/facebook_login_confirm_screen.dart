import 'package:flutter/material.dart';
import 'package:invite_vn/statics/assets.dart';

class FacebookLoginConfirmScreen extends StatefulWidget {
  FacebookLoginConfirmScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFacebookLoginConfirmScreen();
}

class _StateFacebookLoginConfirmScreen
    extends State<FacebookLoginConfirmScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(80.0, 80.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.logo),
          ),
        ),
        buildForm(title: "Họ", controller: firstNameController),
        buildForm(title: "Tên", controller: lastNameController),
        buildForm(title: "Ngày sinh", isBirthday: true),
        buildForm(title: "Giới tính", isGender: true),
      ],
    );
  }

  Widget buildForm(
      {String title,
      TextEditingController controller,
      bool isBirthday = false,
      bool isGender = false}) {
    Widget inputField;

    if (isGender) {
      inputField = Container();
    } else {
      inputField = TextField(
        enabled: !isBirthday,
        controller: controller,
      );
    }

    return Column(
      children: <Widget>[
        Text(title),
        inputField,
      ],
    );
  }
}
