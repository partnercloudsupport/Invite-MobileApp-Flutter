import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final shape;
  final Color color;
  final ValueGetter<void> onTap;
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
          constraints: BoxConstraints.tight(size),
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
