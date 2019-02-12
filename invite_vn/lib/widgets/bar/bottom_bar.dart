import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateBottomBar();
}

class _StateBottomBar extends State<BottomBar> {
  int _state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: new Offset(0.0, -1.5),
            blurRadius: 2.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
      ),
    );
  }

  Widget child() {
    switch (_state) {
      case 0:
        return RaisedButton(onPressed: () {});
      case 1:
        return Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Đã gửi lời mời"),
                Text("Đang chờ phản hồi")
              ],
            ),
            RaisedButton(onPressed: () {})
          ],
        );

      case 2:
        return Row(
          children: <Widget>[
            Text("Người tạo đã đồng ý"),
            RaisedButton(onPressed: () {}),
          ],
        );

      case 3:
        return RaisedButton(onPressed: () {});
    }
  }
}
