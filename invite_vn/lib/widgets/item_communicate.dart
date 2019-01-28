import 'package:flutter/material.dart';

class ItemCommunicate extends Container {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SizedBox(
        height: 240,
        child: new Stack(
          children: <Widget>[
            new Image.asset(
              // background
              "name",
              fit: BoxFit.fill,
            ),
            new Image.asset(
              // gradient
              "color",
              fit: BoxFit.fill,
            ),
            new Container(
              child: new Image.asset(
                // top icon
                "icon",
                height: 40,
                width: 40,
              ),
              margin: EdgeInsets.all(20.0),
            )
          ],
        ),
      ),
      decoration:
          new BoxDecoration(borderRadius: new BorderRadius.circular(12.0)),
    );
  }
}
