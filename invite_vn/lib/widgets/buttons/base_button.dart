import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final ShapeBorder shape;
  final Color color;
  final GestureTapCallback onTap;
  final Size size;
  final Widget child;

  BaseButton({
    Key key,
    this.shape,
    this.color,
    this.onTap,
    this.size,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
      child: InkWell(
        customBorder: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
        splashColor: Colors.black12,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: size.width,
            minHeight: size.height,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: child,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
